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
				package: 'Iterators-Deprecated' with: [ spec requires: #('Iterators') ];
				package: 'Iterators-Tests' with: [ spec requires: #('Iterators') ];
				package: 'Iterators-CollectionsExtensions' with: [ spec requires: #('Iterators') ];
				package: 'Iterators-CollectionsExtensions-Tests' with: [ spec requires: #('Iterators-CollectionsExtensions') ];
				package: 'Iterators-ShellDSL' with: [ spec requires: #('Iterators') ];
				package: 'Iterators-GTInspector' with: [ spec requires: #('Iterators') ] ]
]
