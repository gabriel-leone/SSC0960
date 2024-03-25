def eh_primo(n, i=2):
    if n <= 2:
        return n == 2
    if n % i == 0:
        return False
    if i * i > n:
        return True
    return eh_primo(n, i + 1)

def proximo_primo(n):
    if eh_primo(n + 1):
        return n + 1
    else:
        return proximo_primo(n + 1)

def maior_diferenca(x, y, maior_dif=0, ultimo_primo=None):
    if x > y:
        return maior_dif
    elif eh_primo(x):
        if ultimo_primo is None:
            return maior_diferenca(x + 1, y, maior_dif, x)
        else:
            return maior_diferenca(x + 1, y, max(maior_dif, x - ultimo_primo), x)
    else:
        return maior_diferenca(x + 1, y, maior_dif, ultimo_primo)

def maior_diferenca_primos(x, y):
    return maior_diferenca(proximo_primo(x - 1), y)
  
x = int(input())
y = int(input())
print(maior_diferenca_primos(x, y))