def baskara(a, b, c):
  delta = b**2 - 4*a*c
  if delta < 0:
    return "Não existe raiz real"
  elif delta == 0:
    return -b/(2*a)
  else:
    x1 = (-b + delta**0.5)/(2*a)
    x2 = (-b - delta**0.5)/(2*a)
    return x1, x2
  
print(baskara(1, 2, 1))