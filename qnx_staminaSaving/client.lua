local isSpawned = true;

AddEventHandler('playerSpawned', function()
  if not isSpawned then
    return;
  end

  events.execute('server', 'init');
  isSpawned = false;
end);

events.execute('isNet', 'setData', function(playerStamina)
  local player = PlayerId();
  local playerStamina = tonumber(playerStamina) or 0;

  SetPlayerStamina(player, playerStamina);
  utils.print('success', 'Data loaded');
end);
