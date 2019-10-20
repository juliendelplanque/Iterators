Extension { #name : #GroupsOfIterator }

{ #category : #'*Iterators-Documentation' }
GroupsOfIterator class >> example [
	<exampleWithExpectedResult: '#((1 2) (3))'>
	| iterator |
	iterator := #(1 2 3) iterator.
	(iterator
		outputTo: 2 groupsOfIt) "Create as much groups of 2 items as possible."
		outputTo: Array
]
