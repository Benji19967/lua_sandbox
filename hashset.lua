local hashset = {}

function hashset.addToSet(set, key)
    set[key] = true
end

function hashset.removeFromSet(set, key)
    set[key] = nil
end

function hashset.setContains(set, key)
    return set[key] ~= nil
end

return hashset
