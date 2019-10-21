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
				package: 'Iterators-Trees' with: [ spec requires: #('Iterators') ];
				package: 'Iterators-Decorators' with: [ spec requires: #('Iterators') ];
				package: 'Iterators-FactoryDSL' with: [ spec requires: #('Iterators-Decorators') ];
				package: 'Iterators-Deprecated' with: [ spec requires: #('Iterators') ];
				package: 'Iterators-Tests' with: [ spec requires: #('Iterators') ];
				package: 'Iterators-Trees-Tests' with: [ spec requires: #('Iterators-Trees' 'Iterators-Tests') ];
				package: 'Iterators-Decorators-Tests' with: [ spec requires: #('Iterators-Decorators' 'Iterators-Tests') ];
				package: 'Iterators-CollectionsExtensions' with: [ spec requires: #('Iterators') ];
				package: 'Iterators-CollectionsExtensions-Tests' with: [ spec requires: #('Iterators-CollectionsExtensions') ];
				package: 'Iterators-ShellDSL' with: [ spec requires: #('Iterators') ];
				package: 'Iterators-GTInspector' with: [ spec requires: #('Iterators') ];
				package: 'Iterators-Benchmarks' with: [ spec requires: #('Iterators') ].
			
			self streamsPlugin: spec.
			self zincStreamsPlugin: spec.
			self neoCSVPlugin: spec.
			
			spec for: #'pharo7.x' do: [ 
				spec
					package: 'Iterators-Pharo7';
					package: 'Iterators-CollectionsExtensions' with: [ spec requires: #('Iterators' 'Iterators-Pharo7') ] ].
			
			spec
				group: 'core' with: #('Iterators' 'Iterators-Trees' 'Iterators-Decorators' 'Iterators-FactoryDSL' 'Iterators-Deprecated');
				group: 'collections' with: #('Iterators-CollectionsExtensions');
				group: 'shell-dsl' with: #('Iterators-ShellDSL');
				group: 'inspector-extensions' with: #('Iterators-GTInspector');
				group: 'tests' with: #('Iterators-Tests' 'Iterators-CollectionsExtensions-Tests');
				group: 'benchmarks' with: #('Iterators-Benchmarks');
				group: 'default' with: #('core' 'collections' 'shell-dsl' 'inspector-extensions' 'streams' 'streams-zinc' 'streams-tests' 'tests' 'benchmarks' ) ]
]

{ #category : #baselines }
BaselineOfIterators >> neoCSVPlugin: spec [
	spec baseline: 'NeoCSV' with: [ spec repository: 'github://svenvc/NeoCSV/repository' ].
	spec
		package: 'Iterators-NeoCSV' with: [ spec requires: #('Iterators' 'NeoCSV') ];
		package: 'Iterators-NeoCSV-Tests' with: [ spec requires: #('Iterators-Tests' 'Iterators-NeoCSV') ].
	
	spec group: 'neocsv' with: #('Iterators-NeoCSV').
	spec group: 'neocsv-tests' with: #('neocsv' 'Iterators-NeoCSV-Tests')
]

{ #category : #baselines }
BaselineOfIterators >> streamsPlugin: spec [
	spec
		package: 'Iterators-Streams' with: [ spec requires: #('Iterators') ];
		package: 'Iterators-Streams-Tests' with: [ spec requires: #('Iterators-Tests' 'Iterators-Streams') ];
		package: 'Iterators-Streams-StreamsExtensions' with: [ spec requires: #('Iterators-Streams') ].
	
	spec group: 'streams' with: #('Iterators-Streams' 'Iterators-Streams-StreamsExtensions').
	spec group: 'streams-tests' with: #('streams' 'Iterators-Streams-Tests')
]

{ #category : #baselines }
BaselineOfIterators >> zincStreamsPlugin: spec [
	spec package: 'Iterators-Streams-ZincStreamsExtensions' with: [ spec requires: #('Iterators-Streams') ].
	
	spec group: 'streams-zinc' with: #('streams' 'Iterators-Streams-ZincStreamsExtensions')
]
