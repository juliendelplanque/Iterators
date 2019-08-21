Class {
	#name : #IteratorsMerger,
	#superclass : #IteratorsWrapper,
	#instVars : [
		'mergeBlock'
	],
	#category : #'Iterators-Wrappers'
}

{ #category : #accessing }
IteratorsMerger >> mergeBlock [
	^ mergeBlock
]

{ #category : #accessing }
IteratorsMerger >> mergeBlock: anObject [
	mergeBlock := anObject
]

{ #category : #accessing }
IteratorsMerger >> next [
	^ self mergeBlock valueWithArguments: super next
]

{ #category : #accessing }
IteratorsMerger >> peek [
	^ self mergeBlock valueWithArguments: super peek
]
