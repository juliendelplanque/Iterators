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
				package: 'Iterators-GTInspector' with: [ spec requires: #('Iterators') ];
				package: 'Iterators-Benchmarks' with: [ spec requires: #('Iterators') ].
			
			spec for: #'pharo7.x' do: [ 
				spec
					package: 'Iterators-Pharo7';
					package: 'Iterators-CollectionsExtensions' with: [ spec requires: #('Iterators' 'Iterators-Pharo7') ] ].
			
			spec
				group: 'core' with: #('Iterators' 'Iterators-Deprecated');
				group: 'collections' with: #('Iterators-CollectionsExtensions');
				group: 'shell-dsl' with: #('Iterators-ShellDSL');
				group: 'inspector-extensions' with: #('Iterators-GTInspector');
				group: 'tests' with: #('Iterators-Tests' 'Iterators-CollectionsExtensions-Tests');
				group: 'benchmarks' with: #('Iterators-Benchmarks') ]
]
