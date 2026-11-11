"""Guarda senhas protegidas pelo sistema operacional (só a biblioteca padrão do Python).

- Mac: Keychain (Acesso às Chaves). O segredo fica no Keychain; o app_config.json só
  guarda o marcador "keychain".
- Windows: DPAPI (CryptProtectData). O segredo vai criptografado no app_config.json e
  só o mesmo usuário do Windows, no mesmo computador, consegue abrir.

Em nenhum caso a senha fica em texto puro no arquivo. Uma cópia do app_config.json
levada para outro computador (ou outro usuário) não abre as senhas.
"""
import base64
import subprocess
import sys

SERVICO_KEYCHAIN = "Planos de Tratamento (Clínica nas Nuvens)"


def suportado():
    return sys.platform in ("darwin", "win32")


# ── Windows: DPAPI via ctypes ──────────────────────────────────────────────────

def _dpapi(dados, proteger):
    import ctypes
    from ctypes import wintypes

    class DATA_BLOB(ctypes.Structure):
        _fields_ = [("cbData", wintypes.DWORD), ("pbData", ctypes.POINTER(ctypes.c_char))]

    buffer = ctypes.create_string_buffer(dados, len(dados))
    entrada = DATA_BLOB(len(dados), ctypes.cast(buffer, ctypes.POINTER(ctypes.c_char)))
    saida = DATA_BLOB()
    funcao = ctypes.windll.crypt32.CryptProtectData if proteger else ctypes.windll.crypt32.CryptUnprotectData
    CRYPTPROTECT_UI_FORBIDDEN = 0x1
    if not funcao(ctypes.byref(entrada), None, None, None, None, CRYPTPROTECT_UI_FORBIDDEN, ctypes.byref(saida)):
        raise OSError("o Windows recusou abrir a senha guardada (outro usuário ou computador?)")
    try:
        return ctypes.string_at(saida.pbData, saida.cbData)
    finally:
        ctypes.windll.kernel32.LocalFree(ctypes.cast(saida.pbData, ctypes.c_void_p))


# ── Mac: Keychain via o utilitário `security` ─────────────────────────────────

def _keychain(*args):
    return subprocess.run(["security", *args], capture_output=True, text=True)


# ── Interface ─────────────────────────────────────────────────────────────────

def guardar(conta, segredo):
    """Protege `segredo` e devolve o texto a gravar no app_config.json."""
    if sys.platform == "darwin":
        r = _keychain("add-generic-password", "-U", "-s", SERVICO_KEYCHAIN, "-a", conta, "-w", segredo)
        if r.returncode:
            raise OSError(f"não consegui gravar no Keychain: {r.stderr.strip()}")
        return "keychain"
    if sys.platform == "win32":
        return "dpapi:" + base64.b64encode(_dpapi(segredo.encode("utf-8"), True)).decode("ascii")
    raise OSError("guardar senhas só funciona no Mac e no Windows")


def ler(conta, guardado):
    """Devolve o segredo a partir do que foi gravado no app_config.json (None se não houver)."""
    if guardado == "keychain" and sys.platform == "darwin":
        r = _keychain("find-generic-password", "-s", SERVICO_KEYCHAIN, "-a", conta, "-w")
        return r.stdout.rstrip("\n") if r.returncode == 0 else None
    if isinstance(guardado, str) and guardado.startswith("dpapi:") and sys.platform == "win32":
        return _dpapi(base64.b64decode(guardado[6:]), False).decode("utf-8")
    return None


def apagar(conta, guardado):
    if guardado == "keychain" and sys.platform == "darwin":
        _keychain("delete-generic-password", "-s", SERVICO_KEYCHAIN, "-a", conta)
