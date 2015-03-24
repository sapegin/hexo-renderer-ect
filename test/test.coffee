'use strict'

path = require('path')
expect = require('chai').expect

console.log process.cwd()

# Mock Hexo
renderer = null
global.hexo = {
	theme: {
		base: path.join(process.cwd(), 'test')
	},
	extend: {
		renderer: {
			register: (from, to, fn) ->
				renderer = fn
		}
	}
}

require('../index')

describe 'Hexo ECT renderer', ->

	it 'should be function', (done) ->
		expect(renderer).to.be.a.function
		done()

	it 'should render template files', (done) ->
		result = renderer({path: path.join(process.cwd(), 'test/layout/test.ect')}, {world: 'world'})
		expect(result).to.equals('Hello world!\n')
		done()

