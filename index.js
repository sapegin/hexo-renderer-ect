// Author: Artem Sapegin, http://sapegin.me, 2015

'use strict';

var path = require('path');
var ECT = require('ect');

var basePath = path.join(hexo.theme.base, 'layout');
var renderer = ECT({
	root: basePath,
	ext: '.ect'
});

hexo.extend.renderer.register('ect', 'html', function(data, locals) {
	return renderer.render(path.relative(basePath, data.path), locals);
}, true);
