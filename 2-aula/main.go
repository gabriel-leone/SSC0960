package main

import "fmt"

func somavec(a, b int) int {
	return a + b
}

func minvec(a, b int) int {
	if a < b {
		return a
	}
	return b
}

func maxvec(a, b int) int {
	if a > b {
		return a
	}
	return b
}

func cabeca(a []int) int {
	return a[0]
}

func applyvec(a []int, f func(int, int) int) int {
	if len(a) == 1 {
		return a[0]
	} else {
		c := cabeca(a)
		m := applyvec(a[1:], f)
		return f(c, m)
	}
}

// Função abaixo deve receber um vetor e uma função dizendo se você vai printar os positivos ou negativos daquele vetor
func selectvec(a []int, f func(int) bool) []int {
	if len(a) == 0 {
		return []int{}
	}
	c := cabeca(a)
	if f(c) {
		return append([]int{c}, selectvec(a[1:], f)...)
	}
	return selectvec(a[1:], f)
}

func qs(a []int, less func(int, int) bool, pickPivot func([]int) int) []int {
	if len(a) < 2 {
		return a
	}

	pivot := pickPivot(a)
	lessThanPivot := selectvec(a, func(n int) bool { return less(n, pivot) })
	equalToPivot := selectvec(a, func(n int) bool { return n == pivot })
	greaterThanPivot := selectvec(a, func(n int) bool { return less(pivot, n) })

	return append(
		append(
			qs(lessThanPivot, less, pickPivot),
			equalToPivot...),
		qs(greaterThanPivot, less, pickPivot)...)
}

func main() {
	a := []int{1, 2, 3, 4, 5, -10, -6, 41, 0, -1, 2, 3, 4, 5, 6, 7, 8, 9, 10}
	println("Soma vetor com applyvec:", applyvec(a, somavec))
	println("Min do vetor com applyvec:", applyvec(a, minvec))
	println("Max do vetor com applyvec:", applyvec(a, maxvec))
	positivos := selectvec(a, func(n int) bool { return n > 0 })
	negativos := selectvec(a, func(n int) bool { return n < 0 })

	fmt.Println("Vetor com positivos:", positivos)
	fmt.Println("Vetor com negativos:", negativos)
	fmt.Println("Vetor ordenado:", qs(a, func(a, b int) bool { return a < b }, func(a []int) int { return a[len(a)/2] }))
	fmt.Println("Vetor ordenado:", qs(a, func(a, b int) bool { return a > b }, cabeca))
}
