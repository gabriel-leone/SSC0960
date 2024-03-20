package main

import (
	"fmt"
	"math"
)

func baskara(a, b, c float64) (float64, float64, error) {
	delta := b*b - 4*a*c
	if delta < 0 {
		return 0, 0, fmt.Errorf("delta é negativo: %f", delta)
	} else if delta == 0 {
		x := -b / (2 * a)
		return x, x, nil
	} else {
		x1 := (-b + math.Sqrt(delta)) / (2 * a)
		x2 := (-b - math.Sqrt(delta)) / (2 * a)
		return x1, x2, nil
	}
}

func soma_interacao(n int) int {
	i := 1
	soma := 0
	for i <= n {
		soma += i
		i++
	}
	return soma
}

func soma_recursiva(n int) int {
	if n == 0 {
		return 0
	}
	return n + soma_recursiva(n-1)
}

func soma_recursiva2(n int) int {
	return soma_i_ate_n(1, n)
}

func soma_i_ate_n(i, n int) int {
	if i > n {
		return 0
	}
	return i + soma_i_ate_n(i+1, n)
}

func soma_recursiva3(n int) int {
	return soma_aux(1, 0, n)       // 1 é o i, 0 é a soma e n é o parâmetro limite
}

func soma_aux(i, soma, n int) int {
	if i > n {         							// exatamente a guarda do while, que retorna a soma
		return soma										// o retorno da função após a condição de parada
	}
	return soma_aux(i+1, soma+i, n) // i+1 é a iteração do i, soma+i é a soma e n é o parâmetro limite
}

// s(4)
// 	s(1, 0, 4)
// 		s(2, 1, 4)
// 			s(3, 3, 4)
// 				s(4, 6, 4)
// 					s(5, 10, 4)
// 					10

func bagaca(a, b, c int) int {
	x := a + 1
	y := b + c - 5
	z := x + 3
	s := a * b
	for x*y < a-b {
			s = s + 1
			x = x - a
			y = y + c
			z = 3
	}
	return x - z
}

func bagaca2(a, b, c int) (int) {
	return bagaca_aux(a, b, c, a + 1, b + c - 5, a * b, 3)
}

func bagaca_aux(a, b, c, x, y, s, z int) int {
	if x*y >= a-b {
			return x - z
	}
	return bagaca_aux(a, b, c, x - a, y + c, s + 1, 3)
}

func somavec(a []int) int {
	if len(a) == 0 {
		return 0
	}
	return a[0] + somavec(a[1:])
}

func minvec(a []int) int {
	if len(a) == 1 {
		return a[0]
	}
	min := minvec(a[1:])
	if a[0] < min {
		return a[0]
	}
	return min
}

func maxvec(a []int) int {
	if len(a) == 1 {
		return a[0]
	}
	max := maxvec(a[1:])
	if a[0] > max {
		return a[0]
	}
	return max
}

func diffvec(a []int) int {
	return maxvec(a) - minvec(a)
}

func main() {
	fmt.Println("----- BASKARA -----")
	fmt.Println()
	fmt.Println(baskara(1, -5, 6))  // (3, 2)
	fmt.Println(baskara(1, -3, 2))  // (2, 1)
	fmt.Println(baskara(1, -8, 12)) // (6, 2)
	fmt.Println(baskara(1, 2, 3))   // (0, 0) delta é negativo: -8
	fmt.Println()
	fmt.Println("----- SOMA INTERAÇÃO -----")
	fmt.Println()
	fmt.Println(soma_interacao(10)) // 55
	fmt.Println(soma_interacao(5))  // 15
	fmt.Println(soma_interacao(3))  // 6
	fmt.Println()
	fmt.Println("----- SOMA RECURSIVA -----")
	fmt.Println()
	fmt.Println(soma_recursiva(10)) // 55
	fmt.Println(soma_recursiva(5))  // 15
	fmt.Println(soma_recursiva(3))  // 6
	fmt.Println()
	fmt.Println("----- SOMA RECURSIVA 2 -----")
	fmt.Println()
	fmt.Println(soma_recursiva2(10)) // 55
	fmt.Println(soma_recursiva2(5))  // 15
	fmt.Println(soma_recursiva2(3))  // 6
	fmt.Println()
	fmt.Println("----- SOMA RECURSIVA 3 -----")
	fmt.Println()
	fmt.Println(soma_recursiva3(10)) // 55
	fmt.Println(soma_recursiva3(5))  // 15
	fmt.Println(soma_recursiva3(3))  // 6
	fmt.Println()
	fmt.Println("----- BAGAÇA -----")
	fmt.Println()
	fmt.Println(bagaca(1, 2, 3)) // -2
	fmt.Println(bagaca(2, 3, 4)) // -3
	fmt.Println(bagaca(3, 4, 5)) // -4
	fmt.Println()
	fmt.Println("----- BAGAÇA 2 -----")
	fmt.Println()
	fmt.Println(bagaca2(1, 2, 3)) // -2
	fmt.Println(bagaca2(2, 3, 4)) // -3
	fmt.Println(bagaca2(3, 4, 5)) // -4
	fmt.Println()
	fmt.Println("----- SOMA VETOR -----")
	fmt.Println()
	a := []int{1, 2, 3, 4, 5}
	b := []int{1, 3, 5, 7, 9}
	c := []int{1, 4, 8, 12, 16}
	fmt.Println(somavec(a)) // 15
	fmt.Println(somavec(b)) // 15
	fmt.Println(somavec(c)) // 5
	fmt.Println()
	fmt.Println("----- MIN VETOR -----")
	fmt.Println()
	fmt.Println(minvec(a)) // 1
	fmt.Println(minvec(b)) // 1
	fmt.Println(minvec(c)) // 1
	fmt.Println()
	fmt.Println("----- MAX VETOR -----")
	fmt.Println()
	fmt.Println(maxvec(a)) // 5
	fmt.Println(maxvec(b)) // 5
	fmt.Println(maxvec(c)) // 1
	fmt.Println()
	fmt.Println("----- DIFF VETOR -----")
	fmt.Println()
	fmt.Println(diffvec(a)) // 4
	fmt.Println(diffvec(b)) // 4
	fmt.Println(diffvec(c)) // 0
}
