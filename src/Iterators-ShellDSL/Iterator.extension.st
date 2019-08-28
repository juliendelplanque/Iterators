Extension { #name : #Iterator }

{ #category : #'*Iterators-ShellDSL' }
Iterator >> & anIterator [
	^ IteratorsList new
		add: self;
		add: anIterator;
		yourself
]

{ #category : #'*Iterators-ShellDSL' }
Iterator >> > aCollectionClass [
	^ self upToEndAs: aCollectionClass
]

{ #category : #'*Iterators-ShellDSL' }
Iterator >> >> aAddableCollection [
	^ self upToEndInto: aAddableCollection
]

{ #category : #'*Iterators-ShellDSL' }
Iterator >> | anIteratorDecorator [
	^ anIteratorDecorator decorate: self
]
