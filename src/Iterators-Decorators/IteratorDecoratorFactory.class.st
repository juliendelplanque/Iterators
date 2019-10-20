"
My class-side provides factory methods to build iterator decorator easily.
"
Class {
	#name : #IteratorDecoratorFactory,
	#superclass : #Object,
	#category : #'Iterators-Decorators-Factory'
}

{ #category : #factory }
IteratorDecoratorFactory class >> collectIteratorFor: aValuable [
	^ CollectIterator new
			block: aValuable;
			yourself
]

{ #category : #factory }
IteratorDecoratorFactory class >> detectIteratorFor: aValuable [
	^ DetectIterator new
			block: aValuable;
			yourself
]

{ #category : #factory }
IteratorDecoratorFactory class >> doIteratorFor: aValuable [
	^ PreActionIterator new
			block: aValuable;
			yourself
]

{ #category : #factory }
IteratorDecoratorFactory class >> flatCollectIteratorFor: aValuable [
	^ FlatCollectIterator new
			block: aValuable;
			yourself
]

{ #category : #factory }
IteratorDecoratorFactory class >> groupedByIteratorFor: aValuable [
	^ GroupedByIterator new
		block: aValuable;
		yourself
]

{ #category : #factory }
IteratorDecoratorFactory class >> groupsOfIteratorFor: anInteger [
	^ GroupsOfIterator new
		groupSize: anInteger;
		yourself
]

{ #category : #factory }
IteratorDecoratorFactory class >> injectIntoIteratorForBaseValue: baseValue withBlock: aBlock [
	^ InjectIntoIterator new
		baseValue: baseValue;
		block: aBlock;
		yourself
]

{ #category : #factory }
IteratorDecoratorFactory class >> limitIteratorFor: anInteger [
	^ LimitIterator new
		limit: anInteger;
		yourself
]

{ #category : #factory }
IteratorDecoratorFactory class >> mergeIteratorFor: aValuable [
	^ IteratorsMerger new
			block: aValuable;
			yourself
]

{ #category : #factory }
IteratorDecoratorFactory class >> piecesCutWhereIteratorFor: aValuableWithTwoArguments [
	^ PiecesCutWhereIterator block: aValuableWithTwoArguments
]

{ #category : #factory }
IteratorDecoratorFactory class >> reduceIteratorFor: aValuable [
	^ ReduceIterator new
			block: aValuable;
			yourself
]

{ #category : #factory }
IteratorDecoratorFactory class >> rejectIteratorFor: aValuable [
	^ SelectIterator new
			block: [ :object | (aValuable value: object) not ];
			yourself
]

{ #category : #factory }
IteratorDecoratorFactory class >> selectIteratorFor: aValuable [
	^ SelectIterator new
			block: aValuable;
			yourself
]

{ #category : #factory }
IteratorDecoratorFactory class >> separateIteratorFor: aValuable [
	^ PreActionIterator new
			conditionBlock: [ :objectsSeenCount | objectsSeenCount > 0 ];
			block: aValuable;
			yourself
]

{ #category : #factory }
IteratorDecoratorFactory class >> skipIteratorFor: anInteger [
	^ SkipIterator new
		count: anInteger;
		yourself
]

{ #category : #factory }
IteratorDecoratorFactory class >> sortIteratorFor: aSortObject [
	^ SortIterator new
			block: aSortObject;
			yourself
]

{ #category : #factory }
IteratorDecoratorFactory class >> splitOnIteratorFor: objectToSplitOn [
	^ SplitOnIterator objectToSplitOn: objectToSplitOn
]

{ #category : #factory }
IteratorDecoratorFactory class >> untilIteratorFor: aValuable [
	^ UntilIterator block: aValuable
]

{ #category : #factory }
IteratorDecoratorFactory class >> windowIteratorFor: anInteger [
	^ WindowIterator windowSize: anInteger
]

{ #category : #factory }
IteratorDecoratorFactory class >> windowIteratorFor: anInteger step: step [
	^ WindowIterator windowSize: anInteger step: step
]
