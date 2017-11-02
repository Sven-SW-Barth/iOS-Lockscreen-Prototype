# Import file "ios lockscreen prototype"
sketch = Framer.Importer.load("imported/ios%20lockscreen%20prototype@3x", scale: 1)

codeR = "1234"
code = ""

codePoints = [sketch.code1, sketch.code2, sketch.code3, sketch.code4]

for i in codePoints
	i.visible = true
	i.opacity = 0

darker.opacity = 0

sketch.background.visible = false;
sketch.home.visible = false;
sketch.background.visible = false


sketch.unlock.backgroundColor = "rgba(0, 0, 0, 0)"

unlocked = new Layer
	size: Screen.size
	image: "images/unlocked.png"

unlocked.size = 0.9;
unlocked.opacity = 0;

sketch.Group.opacity = 0.25
sketch.Group_2.opacity = 0.25
sketch.Group_3.opacity = 0.25
sketch.Group_4.opacity = 0.25
sketch.Group_5.opacity = 0.25
sketch.Group_6.opacity = 0.25
sketch.Group_7.opacity = 0.25
sketch.Group_8.opacity = 0.25
sketch.Group_9.opacity = 0.25
sketch.Group_10.opacity = 0.25

pager = new PageComponent
	size: Screen.size
	scrollVertical: false

homeC = new Layer
	width: Screen.width
	height: Screen.height
	image: "images/home.png"
	parent: pager.content
	

statusbar = new Layer
	width: Screen.width
	height: Screen.height
	image: "images/statusbar.png"


pager.addPage(sketch.unlock)

check = ->
	print code.length
	
	drawDots()
				
	if code.length > 3
		if code == codeR
			print "right"
			unlock()
		else
			
# 			wrongCode()
# 			for i in codePoints
# 				i.visible = false
			drawDots()
			deleteDots()
			code = ""
			
	

drawDots = ->
	if code.length > 0
		for i in [0..code.length-1]
			codePoints[i].opacity = 1
	else if code.length < 4
		for i in [code.length..3]
			codePoints[i].opacity = 0
			
deleteDots = ->
	for i in [0..3]
			codePoints[i].animate
				opacity: 0
	

sketch.$1.onTapStart ->
	code += 1
	sketch.Group.animate
		opacity: 1
		options:
			time: 0.1
			curve: Bezier.ease

sketch.$1.onTapEnd ->
	sketch.Group.animate
		opacity: 0.25
		options:
			time: 0.4
			curve: Bezier.ease
	check()
	
sketch.$2.onTapStart ->
	code += 2
	sketch.Group_2.animate
		opacity: 1
		options:
			time: 0.1
			curve: Bezier.ease

sketch.$2.onTapEnd ->
	sketch.Group_2.animate
		opacity: 0.25
		options:
			time: 0.4
			curve: Bezier.ease
	check()

sketch.$3.onTapStart ->
	code += 3
	sketch.Group_3.animate
		opacity: 1
		options:
			time: 0.1
			curve: Bezier.ease

sketch.$3.onTapEnd ->
	sketch.Group_3.animate
		opacity: 0.25
		options:
			time: 0.4
			curve: Bezier.ease
	check()
	
sketch.$4.onTapStart ->
	code += 4
	sketch.Group_4.animate
		opacity: 1
		options:
			time: 0.1
			curve: Bezier.ease

sketch.$4.onTapEnd ->
	sketch.Group_4.animate
		opacity: 0.25
		options:
			time: 0.4
			curve: Bezier.ease
	check()
	
sketch.$5.onTapStart ->
	code += 5
	sketch.Group_5.animate
		opacity: 1
		options:
			time: 0.1
			curve: Bezier.ease

sketch.$5.onTapEnd ->
	sketch.Group_5.animate
		opacity: 0.25
		options:
			time: 0.4
			curve: Bezier.ease
	check()

sketch.$6.onTapStart ->
	code += 6
	sketch.Group_6.animate
		opacity: 1
		options:
			time: 0.1
			curve: Bezier.ease

sketch.$6.onTapEnd ->
	sketch.Group_6.animate
		opacity: 0.25
		options:
			time: 0.4
			curve: Bezier.ease
	check()

sketch.$7.onTapStart ->
	code += 7
	sketch.Group_7.animate
		opacity: 1
		options:
			time: 0.1
			curve: Bezier.ease

sketch.$7.onTapEnd ->
	sketch.Group_7.animate
		opacity: 0.25
		options:
			time: 0.4
			curve: Bezier.ease
	check()

sketch.$8.onTapStart ->
	code += 8
	sketch.Group_8.animate
		opacity: 1
		options:
			time: 0.1
			curve: Bezier.ease

sketch.$8.onTapEnd ->
	sketch.Group_8.animate
		opacity: 0.25
		options:
			time: 0.4
			curve: Bezier.ease
	check()
	
sketch.$9.onTapStart ->
	code += 9
	sketch.Group_9.animate
		opacity: 1
		options:
			time: 0.1
			curve: Bezier.ease

sketch.$9.onTapEnd ->
	sketch.Group_9.animate
		opacity: 0.25
		options:
			time: 0.4
			curve: Bezier.ease
	check()

sketch.$0.onTapStart ->
	code += 1
	sketch.Group_10.animate
		opacity: 1
		options:
			time: 0.1
			curve: Bezier.ease

sketch.$0.onTapEnd ->
	sketch.Group_10.animate
		opacity: 0.25
		options:
			time: 0.4
			curve: Bezier.ease
	check()

sketch.cancel.onTap ->
	pager.snapToPage(homeC)
	code = ""
	drawDots()
	
	
pager.content.on "change:x", ->
	hintergrund.blur = Utils.modulate this.x, [0, -375], [0, 5]
	hintergrund.scale = Utils.modulate this.x, [0, -375], [1, 1.1]
	darker.opacity = Utils.modulate this.x, [0, -375], [0, 0.3]



unlock = ->
	sketch.unlock.animate
		maxY: 0
		options:
			time: 0.4
	hintergrund.animate
		blur: 0
		scale: 1
		options:
			time: 0.4
	darker.animate
		opacity: 0
		options:
			time: 0.4
	unlocked.animate
		opacity: 1
		s

