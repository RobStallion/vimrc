const timesTwo = n => n * 2

const timesFour = (n) => { return n * 4 }

const timesEight = (n) => {
  const n1 = timesTwo(n)
  const n2 = timesFour(n1)
  return n2
}

const square = n => n * n

console.log(timesTwo(5))
console.log(timesFour(5))
console.log(timesEight(5))
console.log(square(5))

const arr1 = [1,2,3,4,5]
const arr2 = ['str1', 'str2']
const arr3 = ["str1", "str2"]