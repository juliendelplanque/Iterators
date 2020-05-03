Class {
	#name : #IteratorBenchmarks,
	#superclass : #Object,
	#instVars : [
		'benchTime'
	],
	#category : #'Iterators-Benchmarks'
}

{ #category : #benchmarking }
IteratorBenchmarks >> benchDoubleEven [
	<benchmark>
	(((((((((1 to: 100000) basicIterator
		outputTo: [ :a | a * 2 ] collectIt)
		outputTo: [ :a | a even ] selectIt)
		outputTo: [ :a | a * 2 ] collectIt)
		outputTo: #even selectIt)
		outputTo: [ :a | a * 2 ] collectIt)
		outputTo: #even selectIt)
		outputTo: [ :a | a * 2 ] collectIt)
		outputTo: #even selectIt) > Array
]

{ #category : #benchmarking }
IteratorBenchmarks >> benchDoubleEvenWithLimit [
	<benchmark>
	((((((((((1 to: 100000) basicIterator
		outputTo: [ :a | a * 2 ] collectIt)
		outputTo: [ :a | a even ] selectIt)
		outputTo: [ :a | a * 2 ] collectIt)
		outputTo: #even selectIt)
		outputTo: [ :a | a * 2 ] collectIt)
		outputTo: #even selectIt)
		outputTo: [ :a | a * 2 ] collectIt)
		outputTo: #even selectIt)
		outputTo: 100 limitIt) > Array
]

{ #category : #accessing }
IteratorBenchmarks >> benchTime [
	^ benchTime
]

{ #category : #accessing }
IteratorBenchmarks >> benchTime: anObject [
	benchTime := anObject
]

{ #category : #accessing }
IteratorBenchmarks >> defaultBenchTime [
	^ 5 seconds
]

{ #category : #initialization }
IteratorBenchmarks >> initialize [
	super initialize.
	self benchTime: self defaultBenchTime
]

{ #category : #accessing }
IteratorBenchmarks >> methodsToBenchmark [
	^ (Pragma allNamed: #benchmark in: self class) collect: #method
]

{ #category : #running }
IteratorBenchmarks >> run [
	^ self methodsToBenchmark collect: [ :method |
		{ 
			method selector.
			[ method selector value: self ] benchFor: self benchTime.
		} ]
]
