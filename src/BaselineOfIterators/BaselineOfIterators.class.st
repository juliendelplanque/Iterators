Class {
	#name : #BaselineOfIterators,
	#superclass : #BaselineOf,
	#category : #BaselineOfIterators
}

{ #category : #baselines }
BaselineOfIterators >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [
			"Packages"
			spec
				package: 'Iterators';
				package: 'Iterators-Tests' with: [ spec requires: #('Iterators') ];
				package: 'Iterators-CollectionsExtensions' with: [ spec requires: #('Iterators') ];
				package: 'Iterators-CollectionsExtensions-Tests' with: [ spec requires: #('Iterators-CollectionsExtensions') ].
				
			spec for: #'pharo6.x'
				do: [ 
					spec
						package: 'Iterators-Pharo61';
						package: 'Iterators-Tests' with: [ spec requires: #('Iterators' 'Iterators-Pharo61') ] ] ]
]
