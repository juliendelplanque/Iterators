"
I am a decorator which classify the objects in my input according to a classifier block.

The classifier output is an iterator of association objects. The keys in the associations are the results of the classifier block. The values for each key is an iterator of the object which are classified under that key.

The order of keys in the key-iterator is sorted using the #sort method of SequenceableCollection.
The order of the objects in the iterator for a specific key is the oreder they appear in the input stream.

Notice: In most other libraries this class would implement ""group by"" instead of ""classify on"". But for historical reasons groupBy does something else in smalltalk.
"
Class {
	#name : #ClassifyOnIterator,
	#superclass : #IteratorDecorator,
	#instVars : [
		'inStream',
		'tempDict',
		'inIterator',
		'classifierBlock'
	],
	#category : #'Iterators-Decorators'
}

{ #category : #'instance creation' }
ClassifyOnIterator class >> classifier: aBlockClosure [ 
	^self new classifier: aBlockClosure 
]

{ #category : #private }
ClassifyOnIterator >> addToDict: dict object: obj [ 
	| key |
	key := classifierBlock value: obj.
	(dict includesKey: key) ifTrue: [ (dict at: key) add: obj ] ifFalse: [ dict at: key put: (OrderedCollection with: obj)]
]

{ #category : #'instance creation' }
ClassifyOnIterator >> classifier: aBlockClosure [
	classifierBlock := aBlockClosure 
]

{ #category : #accessing }
ClassifyOnIterator >> decorate: anIterator [
	| dict n keys |
	inIterator := anIterator.
	dict := Dictionary new.
	[ inIterator hasNext ]
		whileTrue: [ n := inIterator next.
			self addToDict: dict object: n ].
	keys := dict keys asOrderedCollection sort.
	^(GeneratorWrapper generator: [ :gen | keys do: [ :key | gen yield: (key -> (dict at: key) iterator) ] ])
]
