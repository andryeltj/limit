function love.load()
 lg=love.graphics
 lfs=love.filesystem
 require("config")
 datafont={}
 function gf(e,fontfolder)
   local fontfolder = fontfolder or "res/fonts/"
   a=lfs.newFileData(fontfolder..e)
   table.insert(datafont,a)
 end
 love.window.setMode(200, 180)
 --love.window.setMode(800, 800)
 love.window.setIcon(love.image.newImageData("res/limit512.png"))
 love.window.setTitle("Limit")
 mainfontsize=16
 rdd=6
 constant=0.50560000000005
 gf("NotoSans-Light.ttf")
 gf("mui-symbols.ttf")
 gf("NotoSerifJP-Light.otf")
 bgm = love.audio.newSource(audiobell, "stream")
 image = lg.newImage ('res/bitmap3.png')
 fontdings=lg.setNewFont(datafont[2], mainfontsize+3)
 fontsystem=lg.setNewFont(datafont[1], mainfontsize)
 fontstarts=lg.setNewFont(datafont[2], mainfontsize-3)
 fonttab=lg.setNewFont(datafont[3], mainfontsize)
 dings={"","•","￮","","","","","","*"}
 exec=""
 div=(math.pi*2)/(math.pi*10000)
 dividing={1} -- Define 1/4 angle constant
 mousex, mousey = love.mouse.getPosition( )
 tbDisplay={}
 Display="0000"
 aba=1
 tbTimers={0}
 tbDisplayTime={0,0,0}
 tbControl={0}
 showexec=1
 tbStarts={0}
 sdact=dings[7]
 sound=1
 sdbthv=0
 -- 3.1415926535898 6.2831853071796 1
 -- 6.2135930648526	9.3551857184424	0.50560000000005	2472
 --MAX 6.2062280789993 | 
 mousex, mousey = love.mouse.getPosition( )
 ct=1
 td=0
 wa,ha=0,0
 canva=1
 bks=1
 quartcircle = math.pi / 1-div
 initialtime=""
end
function love.update(dt)
 td=td+dt
 if td >= 1 then
 td=td-1
 for i, v in pairs(tbControl) do
  if v == 1 then
    ct=ct-div
    tbTimers[i]=tbTimers[i]-1;
    if tbTimers[i] <= 0
    then tbControl[i]=0;tbTimers[i]=0;dividing[aba]=1;if sound == 1 then love.audio.play(bgm) end
    else
      --dividing[aba]=(rulethree(2469,100,rulethree2(tbStarts[i],100,tbTimers[i])))*div
      divid=(rulethree2(tbStarts[i],100,tbTimers[i]))
      --print(i,divid)
      dividing[i]=porcentagemParaNumero(divid)
      if i == aba then countdodisplay() end
    end
  end
 end
 end
 if tbControl[aba] == 1 then exec=dings[5] else exec=dings[4] end
 quartcircle = math.pi / dividing[aba] 
 --imageResize(style,img,newWidth,newHeight)
 imgow,imgoh = image:getDimensions()
 sw,sh = imageResize(image, 180, 200 )
 wa,ha = imgow*sw,imgoh*sh
 readtab()
 countinitialt()
end
function love.draw( )
  --print(aba,tbTimers[aba],dividing[aba],tbControl[aba])
  mousevent(0,0,180,200)
  lg.setBackgroundColor(backgrounds[bks])
  --lg.setBackgroundColor(0.317647059,0.176470588,0.658823529)
  --print(quartcircle,math.pi+quartcircle,dividing[aba],ik)
  love.graphics.push() 
  --love.graphics.translate(258,-10)
  love.graphics.translate(278,0)
  love.graphics.scale(1.7, 1)
  --love.graphics.rotate(89.55);
  love.graphics.rotate(89.65)
  lg.setColor(.1,.1,.1,.15)
  lg.arc( "line", "open", 100, 120, 68, math.pi/1-div, math.pi*2 )
  lg.arc( "line", "open", 100, 120, 69, math.pi/1-div, math.pi*2 )
  lg.arc( "line", "open", 100, 120, 70, math.pi/1-div, math.pi*2 )
  lg.arc( "line", "open", 100, 120, 71, math.pi/1-div, math.pi*2 )
  lg.arc( "line", "open", 100, 120, 72, math.pi/1-div, math.pi*2 )
  lg.arc( "line", "open", 100, 120, 73, math.pi/1-div, math.pi*2 )
  lg.setColor(0,0,0)
  lg.arc( "line", "open", 100, 120, 68, quartcircle, math.pi*2 )
  lg.arc( "line", "open", 100, 120, 73, quartcircle, math.pi*2 )
  lg.setColor( progressbar[bks] )
  lg.arc( "line", "open", 100, 120, 68, quartcircle, math.pi*2 )
  lg.arc( "line", "open", 100, 120, 69, quartcircle, math.pi*2 )
  lg.arc( "line", "open", 100, 120, 70, quartcircle, math.pi*2 )
  lg.arc( "line", "open", 100, 120, 71, quartcircle, math.pi*2 )
  lg.arc( "line", "open", 100, 120, 72, quartcircle, math.pi*2 )
  lg.arc( "line", "open", 100, 120, 73, quartcircle, math.pi*2 )
  love.graphics.pop()
  lg.setColor(1,1,1,.1);lg.draw(image,0,0,0,sw,sh)
  lg.setFont(fontsystem)
  --lg.print(mousex..","..mousey,mousex-60, mousey)
  numbers()
  lg.setColor(1,1,1);lg.setFont(fonttab);lg.printf(dings[1],0,160,200,"center")
  if showexec == 1 then lg.setColor(1,1,1,.1);lg.rectangle("fill",72,109,32,32,50) end
  if showexec == 2 then lg.setColor(1,1,1,.3);lg.rectangle("fill",72,109,32,32,50) end
  lg.setFont(fontdings)
  love.graphics.push()
  --lg.setColor( .7, .7, 1 )
  --love.graphics.setLineWidth(0.5);
  love.graphics.translate(18,-93)
  love.graphics.scale(1,2)
  love.graphics.shear(-0.2, 0)
  lg.setColor( 0,0,0 );lg.printf(Display,0,78,173,"center")
  lg.setColor( timers[bks] );lg.printf(Display,0,78,173,"center")
  love.graphics.pop()
  iside=(function()
   showexec=1
   execlick=(function() showexec=2; if tonumber(tbTimers[aba]) > 0
   then tbStarts[aba]=tbTimers[aba];tbControl[aba]=1; exec=dings[5]; end
 end);
   end)
   posexec=(function() showexec=0 end)
 --oside=(function() showexec=0 end)
  oside=(function() showexec=0 end)
  mousevent(73,109,40,40,iside,oside)
  lg.setColor(controls[bks]); lg.printf(exec,0,115,175,"center")
  soin=(function()
    sdbthv = 1
	execlick=(function() sdbthv = 2;
	if sound == 0 then sound=1;sdact=dings[7] else sound = 0;sdact=dings[8] end end)
	if sdbthv == 1 then lg.setColor(1,1,1,.1);lg.rectangle("fill",165,0,32,32,50) end
	if sdbthv == 2 then lg.setColor(1,1,1,.3);lg.rectangle("fill",165,0,32,32,50) end
	posexec=(function() sdbthv=1 end)
	
  end)
  sout=(function() sdbthv=0 end)
  mousevent(165,0,32,32,soin) --,sout)
  lg.setColor(1,1,1);lg.printf(sdact,0,5,190,"right")
  lg.setColor(starttime[bks]);lg.setFont(fontstarts);lg.printf(initialtime,0,38,133,"center")
end

function newtab()
  table.insert(dividing,1);table.insert(tbTimers,0);table.insert(tbControl,0);table.insert(tbStarts,0);
  aba=#tbTimers;--bks=bks+1;
  if bks > #backgrounds then bks=1 end
  readtab()
  countdodisplay()
  countinitialt()
end
function navplus()
  if #tbTimers >= 1 then
  aba=aba+1; if aba > #tbTimers then aba = #tbTimers end
  readtab()
  countdodisplay()
  countinitialt()
  end
end
function navminus()
  if #tbTimers >= 1 then
  --aba=aba-1;bks=bks-1;
  --if aba > 1 then aba=1; bks=1; end
  aba=aba-1; if aba <= 0 then aba = 1 end
  readtab()
  countdodisplay()
  countinitialt()
  end
end
function readtab()
  dings[1]="";
  for i=1, #tbTimers do
    if #tbTimers > 1 then
     if tbControl[i] == 1 then
      if i == aba then dings[1]=dings[1]..dings[2];bksel() else dings[1]=dings[1]..dings[9] end
     else
      if i == aba then dings[1]=dings[1]..dings[2];bksel() else dings[1]=dings[1]..dings[3] end
     end
    end
  end
  --countdodisplay()
  --print("Aba:",aba)
end
function bksel()
  bks=-1
  for i = 0, aba do
    bks=bks+1
    if bks > #backgrounds then bks=1 end
  end
end

function countdodisplay()
  tbDisplayTime[1] = math.floor(tbTimers[aba] / 3600)
  tbDisplayTime[2] = (math.floor(tbTimers[aba] / 60)%60)
  tbDisplayTime[3] = math.floor(tbTimers[aba] % 60)
  --print(tbTimers[aba],tbDisplayTime[1],tbDisplayTime[2],tbDisplayTime[3])
  if tbTimers[aba] < 3599 then
  todisplay = string.format("%02d%02d",tbDisplayTime[2],tbDisplayTime[3])
  else
  todisplay = string.format("%02d%02d%02d",tbDisplayTime[1],tbDisplayTime[2],tbDisplayTime[3])
  end
  reloadtbex(todisplay)
  Display=""
  for i, v in pairs(tbDisplay) do
    Display=Display..v
  end
end
function countinitialt()
  tbDisplayTimeS={0,0,0}
  tbDisplayTimeS[1] = math.floor(tbStarts[aba] / 3600)
  tbDisplayTimeS[2] = (math.floor(tbStarts[aba] / 60)%60)
  tbDisplayTimeS[3] = math.floor(tbStarts[aba] % 60)
  --print(tbTimers[aba],tbDisplayTime[1],tbDisplayTime[2],tbDisplayTime[3])
  if tbStarts[aba] < 3599 then
    if tbStarts[aba] == 0 then initialtime = "" else
    initialtime = string.format("%02d%02d",tbDisplayTimeS[2],tbDisplayTimeS[3]) end
  else
  initialtime = string.format("%02d%02d%02d",tbDisplayTimeS[1],tbDisplayTimeS[2],tbDisplayTimeS[3])
  end
end
function love.keypressed(key)
  if key == "space" then
    showexec = 1;
    if tbControl[aba]==0 then tbStarts[aba]=tbTimers[aba];tbControl[aba]=1; exec=dings[5]; else tbControl[aba]=0; exec=dings[4]; end
  else
    showexec = 0
  end
  if love.keyboard.isDown('lctrl') and key == 'right' or love.keyboard.isDown('rctrl') and key == 'right' or
     love.keyboard.isDown('lctrl') and key == 't' or love.keyboard.isDown('rctrl') and key == 't'
  then	newtab()  end
  if love.keyboard.isDown('lctrl') and key == 'right' or love.keyboard.isDown('rctrl') and key == 'right' or
     love.keyboard.isDown('lctrl') and key == 's' or love.keyboard.isDown('rctrl') and key == 's'
  then	if sound == 1 then sound = 0 else sound = 1 end end
  if love.keyboard.isDown('lctrl') and key == 'x' or love.keyboard.isDown('rctrl') and key == 'x'
  then
   if #tbTimers > 1 then
    table.remove(dividing,aba);
    table.remove(tbTimers,aba);
    table.remove(tbControl,aba);
    table.remove(tbStarts,aba);readtab();countdodisplay() end
   if #tbTimers == 1 then aba=1 end
  end
  if key == 'left' then navminus() end
  if key == 'right'  then navplus() end
end
function reloadtbex(a)
  tbDisplay={}
  for i=1,#a do
    local c=a:sub(i,i) -- mostra caracter na posicao i
    table.insert(tbDisplay,c)
  end
end
function numbers()
  if tbTimers[aba] < 3600 and tbControl[aba] == 0 then
  execin=(function()
    lg.setColor(1,1,1,.15);
    lg.rectangle("line",95,76,40,32,rdd)
    lg.rectangle("fill",95,76,40,32,rdd)
    execrollup=(function()
      if tbControl[aba]==0 then tbTimers[aba]=tbTimers[aba]+1 end
      if tbTimers[aba] < 0 then tbTimers[aba] = 0 end
      countdodisplay()
    end);
    execrolldn=(function()
      if tbControl[aba]==0 then tbTimers[aba]=tbTimers[aba]-1 end
      if tbTimers[aba] < 0 then tbTimers[aba] = 0 end
      countdodisplay()
    end);
  end)
  mousevent(95,76,40,32,execin)
  execin=(function()
    lg.setColor(1,1,1,.15);
    lg.rectangle("line",38,76,40,32,rdd)
    lg.rectangle("fill",38,76,40,32,rdd)
    execrollup=(function()
      if tbControl[aba]==0 then tbTimers[aba]=tbTimers[aba]+60 end
      if tbTimers[aba] < 0 then tbTimers[aba] = 0 end
      countdodisplay()
    end);
    execrolldn=(function()
      if tbControl[aba]==0 then tbTimers[aba]=tbTimers[aba]-60 end
      if tbTimers[aba] < 0 then tbTimers[aba] = 0 end
      countdodisplay()
    end);
  end)
  mousevent(38,76,40,32,execin)
 elseif tbTimers[aba] >= 3600 and tbControl[aba] == 0  then
   execin=(function()
    lg.setColor(1,1,1,.15);
    lg.rectangle("line",123,76,40,32,rdd)
    lg.rectangle("fill",123,76,40,32,rdd)
    execrollup=(function()
      if tbControl[aba]==0 then tbTimers[aba]=tbTimers[aba]+1 end
      if tbTimers[aba] < 0 then tbTimers[aba] = 0 end
      countdodisplay()
    end);
    execrolldn=(function()
      if tbControl[aba]==0 then tbTimers[aba]=tbTimers[aba]-1 end
      if tbTimers[aba] < 0 then tbTimers[aba] = 0 end
      countdodisplay()
    end);
  end)
  mousevent(123,76,40,32, execin)
  execin=(function()
    lg.setColor(1,1,1,.15);
    lg.rectangle("line",66,76,40,32,rdd)
    lg.rectangle("fill",66,76,40,32,rdd)
    execrollup=(function()
      if tbControl[aba]==0 then tbTimers[aba]=tbTimers[aba]+60 end
      if tbTimers[aba] < 0 then tbTimers[aba] = 0 end
      countdodisplay()
    end);
    execrolldn=(function()
      if tbControl[aba]==0 then tbTimers[aba]=tbTimers[aba]-60 end
      if tbTimers[aba] < 0 then tbTimers[aba] = 0 end
      countdodisplay()
    end);
  end)
  mousevent(66,76,40,32,execin)
  execin=(function()
    lg.setColor(1,1,1,.15);
    lg.rectangle("line",7,76,40,32,rdd)
    lg.rectangle("fill",7,76,40,32,rdd)
    execrollup=(function()
      if tbControl[aba]==0 then tbTimers[aba]=tbTimers[aba]+3600 end
      if tbTimers[aba] < 0 then tbTimers[aba] = 0 end
      countdodisplay()
    end);
    execrolldn=(function()
      if tbControl[aba]==0 then tbTimers[aba]=tbTimers[aba]-3600 end
      if tbTimers[aba] < 0 then tbTimers[aba] = 0 end
      countdodisplay()
    end);
  end)
  mousevent(7,76,40,32,execin)
 end
end


function mousevent(a,b,posxw,posyh,execin,execout,canva)
  mousex, mousey = love.mouse.getPosition( )
  --local sa,sb,sposxw,sposyh,scanva = 0,0,0,0,1
  sa,sb,sposxw,sposyh,scanva = a or 0,b or 0,a+posxw or 0,b+posyh or 0,canva or 1
  --local sexecin,sexecout = "",""
  sexecin = execin or ""
  sexecout = execout or ""
  local esx=""
  --print(type(sexecin),type(sexecout))
  if mousex > sa then ai=true else ai=false end
  if mousey > sb then bi=true else bi=false end
  if mousex < sposxw then ci=true else ci=false end
  if mousey < sposyh then di=true else di=false end
  if scanvas == canva then ei=true else ei=false end
  if ai == true and bi == true and ci == true and di == true and ei == true
  then	esx="x";if type(sexecin) == "function" then sexecin() end
  else	esx=".";if type(sexecout)== "function" then sexecout() end
  end
  --print(ai,bi,ci,di,ei,esx)
  --print(a,b,posxw,posyh,mousex..","..mousey,esx,sdbthv)
end
function love.wheelmoved(x, y)
  rollx,rolly=x,y
  --print(type(execrollup),execrollup)
  if y > 0 then if type(execrollup) == "function" then execrollup() end
  elseif y < 0 then if type(execrolldn) == "function" then execrolldn() end
  end
end
function love.mousepressed(x, y, button, istouch)
  --print("clicked",type(execlick))
  pressx,pressy=x,y
  if button == 1
  then	if type(execlick) == "function" and execlick ~= nil then execlick() end end
  if button == 2
  then	if type(exerclick) == "function" and exerclick ~= nil then exerclick() end end
end
function love.mousereleased( x, y, button, istouch, presses )
  pressx,pressy=0,0
  if button == 1 then if type(posexec) == "function" then posexec() end; execlick = ""
  end
end
function percent(a,b,c)
 local a = a or 0
 local b = b or 100
 local x = (b-a)/c
 return x
end
function rulethree(a,b,d)
 local a = a or 0
 local b = b or 100
 local d = d or 1
--	A	=	B
--	X	=	D
 local x = (a*d)/b
 return x
end
function rulethree2(a,b,c)
 local a = a or 1
 local b = b or 100
 local c = c or 1
--	A	=	B
--	C	=	X
 local x = (c*b)/a
 return x
end
function porcentagemParaNumero(porcentagem)
    -- Verifica se a porcentagem está dentro do intervalo válido (0 a 100)
    if porcentagem < 0 or porcentagem > 100 then
        return "Porcentagem inválida. Deve estar entre 0 e 100."
    end
    
    -- Converte a porcentagem para o intervalo entre 1 e 0.50620000000005
    local numero = (porcentagem / 100) * (1 - constant) + constant
    
    return numero
end
function imageResize(style,img,newWidth,newHeight)
  --local style = style or "adjust"; if style == 0 then style="adjust" end
  local style = style
  if type(img) == "number" then newHeight = newWidth; newWidth = img  end
  local newWidth = newWidth or 0
  local newHeight = newHeight or 0
  local img = img
  if type(style) == "userdata" then img = style; style = "adjust"
  else
    if style == nil or style == 0 then style = "adjust" else  style = "fill" end
  end
  local currentWidth, currentHeight = img:getDimensions()
  reasonIh=currentHeight/currentWidth
  reasonIw=currentWidth/currentHeight
  reasonA=newHeight/newWidth
  reasonW = newWidth / currentWidth
  reasonH = newHeight / currentHeight
  --print("resize",style,currentWidth,currentHeight,newWidth,newHeight)
  if style == "fill" then return reasonW, reasonH end
  if style == "adjust" then
    --print("adjust")
    if currentWidth < currentHeight then --if w>h 1:2
     --print("w>h")
     return  reasonH, reasonH
    elseif currentWidth > currentHeight then --if w<h 2:1
     if (reasonIw*newWidth) > newHeight then --if h>H 
      --print("w<h h>H")
      return reasonW, reasonW
     elseif (reasonIw*newWidth) <= newHeight then -- h<H
      --print("w<h h<=H")
      return reasonA, reasonA
     end
    elseif currentWidth == currentHeight then -- if 1:1
     --print("w=h")
     return reasonH, reasonH
    end
  end
end
