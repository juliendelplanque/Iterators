"
A GeneratorWrapperTest is a test class for testing the behavior of GeneratorWrapper
"
Class {
	#name : #GeneratorWrapperTest,
	#superclass : #TestCase,
	#category : #'Iterators-Tests-Wrappers'
}

{ #category : #tests }
GeneratorWrapperTest >> testEmptyGenerator [
	"test a generator that yields nothing - should be empty"
	| res |
	res := (GeneratorWrapper generator: [:gen | ]) > Array.
	self assert: res isEmpty 
]

{ #category : #tests }
GeneratorWrapperTest >> testFiveEvenNumbersGenerator [
	"test a generator that does something - here produce 5 elements"
	| res |
	res := (GeneratorWrapper generator: [:gen | 1 to: 5 do:[:i | gen yield: i*2]]) > Array.
	self assert: res equals: #(2 4 6 8 10)
]

{ #category : #tests }
GeneratorWrapperTest >> testPipingGenerator [
	"Test a generator used in a pipe expression."
	| res |
	res := ((1 to: 3) iterator
		|
			(GeneratorWrapper
				pipe: [ :in :gen | [ in atEnd ] whileFalse: [ gen yield: in next * 3 ] ]))
		> Array.
	self assert: res equals: #(3 6 9)
]
