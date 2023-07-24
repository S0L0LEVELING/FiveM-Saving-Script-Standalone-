local cache = {};

AddEventHandler('playerDropped', function(reason)
  local player = PlayerPedId();
  local identifier = GetPlayerIdentifier(player, 0);
  local currentStamina = GetPlayerStamina(PlayerId());

  cache[identifier] = currentStamina;
end)

events.execute('isNet', 'init', function()
  local identifier = GetPlayerIdentifier(source, 0);

  if not cache[identifier] then
    cache[identifier] = identifier;
  end

  if not cache[identifier] == identifier then
    utils.print('error', 'Something went wrong');
    return;
  end

  events.execute('client', 'setData', cache[identifier]);
end);
