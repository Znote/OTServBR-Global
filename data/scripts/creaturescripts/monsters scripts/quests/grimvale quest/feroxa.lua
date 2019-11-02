local feroxa = CreatureEvent("Feroxa")
function feroxa.onThink(creature, target)
	
	if creature:getName() ~= 'Feroxa' then
		return true
	end
	if creature:getMaxHealth() == 100000 then
		if creature:getHealth() <= 50000 then
			creature:getPosition():sendMagicEffect(CONST_ME_POFF)
			Game.createMonster('Feroxa Werewolf Imune', creature:getPosition(), true, true)
			creature:remove()
		end
	elseif creature:getMaxHealth() == 50000 then
		if creature:getHealth() <= 25000 then
			creature:getPosition():sendMagicEffect(CONST_ME_POFF)
			Game.createMonster('Feroxa Werewolf Killable', creature:getPosition(), true, true)
			creature:remove()
		end
    end
	return true
end
feroxa:register()

local feroxa_werewolf_killable = CreatureEvent("Feroxa Killable")
function feroxa_werewolf_killable.onDeath(creature, target)

	local feroxas = {
		"Feroxa Weak Form",
		"Feroxa Gloom Wolf"
	}
	
	if target:getName() ~= "Feroxa Werewolf Killable" then
		Game.createMonster(feroxas[math.random(1,2)], target:getPosition(), true, true)
    end
	return true
end

feroxa_werewolf_killable:register()