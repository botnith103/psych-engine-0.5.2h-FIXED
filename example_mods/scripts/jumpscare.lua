local inGameOver = false
function onGameOver()
  if dadName=='zardyButDARK' then
		setProperty('inCutscene', true);
		startVideo('zardyMyBeloved');
		inGameOver = true;
end
if dadName=='cablecrow' then
  setProperty('inCutscene',true);
  startVideo('cableCrowPog');
  inGameOver = true;
end
end