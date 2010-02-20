// -------------------------------------------------------------------
// markItUp!
// -------------------------------------------------------------------
// Copyright (C) 2008 Jay Salvat
// http://markitup.jaysalvat.com/
// -------------------------------------------------------------------
// Textile tags example
// http://en.wikipedia.org/wiki/Textile_(markup_language)
// http://www.textism.com/
// -------------------------------------------------------------------
// Feel free to add more tags
// -------------------------------------------------------------------
mySettings = {
	previewParserPath:	'', // path to your Textile parser
	onShiftEnter:		{keepDefault:false, replaceWith:'\n\n'},
	markupSet: [
		{name:'Heading 1', key:'1', openWith:'h1(!(([![Class]!]))!). ', placeHolder:'Your title here...' },
		{name:'Heading 2', key:'2', openWith:'h2(!(([![Class]!]))!). ', placeHolder:'Your title here...' },
		{name:'Heading 3', key:'3', openWith:'h3(!(([![Class]!]))!). ', placeHolder:'Your title here...' },
		{name:'Heading 4', key:'4', openWith:'h4(!(([![Class]!]))!). ', placeHolder:'Your title here...' },
		{name:'Heading 5', key:'5', openWith:'h5(!(([![Class]!]))!). ', placeHolder:'Your title here...' },
		{name:'Heading 6', key:'6', openWith:'h6(!(([![Class]!]))!). ', placeHolder:'Your title here...' },
		{name:'Paragraph', key:'P', openWith:'p(!(([![Class]!]))!). '},
		{separator:'---------------' },
		{name:'Bold', key:'B', closeWith:'*', openWith:'*'},
		{name:'Italic', key:'I', closeWith:'_', openWith:'_'},
		{name:'Stroke through', key:'S', closeWith:'-', openWith:'-'},
		{separator:'---------------' },
		{name:'Bulleted list', openWith:'(!(* |!|*)!)'},
		{name:'Numeric list', openWith:'(!(# |!|#)!)'}, 
		{separator:'---------------' },
		{name:'Picture', replaceWith:'![![Source:!:http://]!]([![Alternative text]!])!'}, 
		{name:'Link', openWith:'"', closeWith:'([![Title]!])":[![Link:!:http://]!]', placeHolder:'Your text to link here...' },
		{separator:'---------------' },
		{name:'Quotes', openWith:'bq(!(([![Class]!]))!). '},
		{name:'Code', openWith:'@', closeWith:'@'},
		{separator:'---------------' },
		{name:'Preview', call:'preview', className:'preview'},
		{	name:'Lorem Ipsum', className:'lorem', dropMenu: [
				{name:'Lorem ipsum...', className:'lorem-special', replaceWith:'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.' },
				{name:'Suspendisse...', className:'lorem-special', replaceWith:'Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor.' },
				{name:'Maecenas...', className:'lorem-special', replaceWith:'Maecenas ligula massa, varius a, semper congue, euismod non, mi.' },
				{name:'Proin porttitor...', className:'lorem-special', replaceWith:'Proin porttitor, orci nec nonummy molestie, non fermentum diam nisl sit amet erat.' },
				{name:'Duis arcu...', className:'lorem-special', replaceWith:'Duis arcu massa, scelerisque vitae, consequat in, pretium a, enim.' },
				{name:'Long paragraph', replaceWith:'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean ut orci vel massa suscipit pulvinar. Nulla sollicitudin. Fusce varius, ligula non tempus aliquam, nunc turpis ullamcorper nibh, in tempus sapien eros vitae ligula. Pellentesque rhoncus nunc et augue. Integer id felis. Curabitur aliquet pellentesque diam. Integer quis metus vitae elit lobortis egestas. Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Morbi vel erat non mauris convallis vehicula. Nulla et sapien. Integer tortor tellus, aliquam faucibus, convallis id, congue eu, quam. Mauris ullamcorper felis vitae erat. Proin feugiat, augue non elementum posuere, metus purus iaculis lectus, et tristique ligula justo vitae magna.' }
			]
		}
	]
}