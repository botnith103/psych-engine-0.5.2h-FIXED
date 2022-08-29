function onCreate()
  --background
  makeLuaSprite('bg','newyears/sky2',-1300,-500)
  makeLuaSprite('floor','newyears/mainstagecorrupted',-600,-400)
  makeAnimatedLuaSprite('bop','newyears/Corrupted_bg_characters',-100,100)
  addAnimationByPrefix('bop','idle','neo garcello',24,true)
  objectPlayAnimation('bop','idle',true)
  makeLuaSprite('tables','newyears/maintablescorruption',-600,-400)
  makeLuaSprite('fog','fog',-600,-400)
  addLuaSprite('bg',false)
  addLuaSprite('floor',false)
  addLuaSprite('bop',false)
  addLuaSprite('tables',false)
  addLuaSprite('fog',true)
  close(true);
  end