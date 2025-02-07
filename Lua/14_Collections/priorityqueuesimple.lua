-- priorityqueuesimple.lua
-- Implémentation manuelle d'une Priority Queue du type heapq, simple (juste des valeurs), avec remplacement possible
-- Garde un dictionnaire en interne pour savoir où se trouve un élément quelconque à remplacer
-- Utilise une liste (tableau dynamique) pour le stockage interne de l'arbre
-- L'élément 0 n'est pas utilisé, ça rend la gestion des index plus simple
-- L'élément [i] a (au max) deux fils, [2*i] et [2*i+1], et un père [i//2]
--
-- 2021-12-28   PV      De 'Programmation efficace'
-- 2022-06-27   PV      Version Lua

PriorityQueue = {
    __name = "PriorityQueue",

    new = function(self, object, initlist)
        object = object or {}
        setmetatable(object, self)
        self.__index = self

        object:clear()
        if initlist then object:addRange(initlist) end

        return object
    end,

    clear = function(self)
        self.heap = {}
        self.rank = {}
    end,

    addRange = function(self, values)
        for _, v in pairs(values) do
            self:push(v)
        end
    end,

    __len = function(self)
        return #self.heap
    end,

    push = function(self, item)
        assert(self.rank[item] == nil)
        local ix = #self.heap + 1
        self.heap[ix] = item
        self.rank[item] = ix
        self:_up(ix)
    end,

    pop = function(self)
        local root = self.heap[1]
        self.rank[root] = nil
        local x = self.heap[#self.heap]
        self.heap[#self.heap] = nil
        if #self.heap >= 1 then
            self.heap[1] = x -- Et on le met à la racine
            self.rank[x] = 1
            self:_down(1) -- On rééquilibre
        end
        return root
    end,

    -- Helper, remonte l'élément d'index ix jusqu'à la position correcte O(log(n))
    _up = function(self, ix)
        local item = self.heap[ix]
        while ix > 1 and item < self.heap[ix // 2] do
            self.heap[ix] = self.heap[ix // 2]
            self.rank[ self.heap[ix] ] = ix
            ix = ix // 2
        end
        self.heap[ix] = item
        self.rank[item] = ix
    end,

    -- Helper, descend l'élément d'index ix jusqu'à la position correcte en gardant l'équilibre
    _down = function(self, ix)
        local item = self.heap[ix]
        local n = 1 + #self.heap
        while true do
            local left = 2 * ix
            local right = left + 1
            -- On commence par la droite s'il y a un fils à droite et que l'élement est plus grand que les fils gauche et droite
            if right < n and self.heap[right] < item and self.heap[right] < item and self.heap[right] < self.heap[left] then
                self.heap[ix] = self.heap[right] -- On monte le fils de droite
                self.rank[ self.heap[right] ] = ix
                ix = right
            elseif left < n and self.heap[left] < item then -- Puis on tente de descendre à gauche
                self.heap[ix] = self.heap[left]
                self.rank[ self.heap[left] ] = ix
                ix = left
            else -- Sinon on a trouvé la position et c'est fini
                self.heap[ix] = item
                self.rank[item] = ix
                return
            end
        end
    end,

    -- Doesn't exist in heapq
    update = function(self, old, new)
        local ix = self.rank[old]
        self.rank[old] = nil
        self.heap[ix] = new
        self.rank[new] = ix
        if old < new then
            self:_down(ix)
        else
            self:_up(ix)
        end
    end,

    __tostring = function(self)
        return self.__name .. " [" .. table.concat(self.heap, ", ") .. "]"
    end,
}

-- Tests
if not pcall(debug.getlocal, 4, 1) then -- https://stackoverflow.com/questions/49375638/how-to-determine-whether-my-code-is-running-in-a-lua-module
    -- For VSCode, debug terminal is not utf8 by default
    if package.config:sub(1,1)=='\\' then os.execute("chcp 65001 >NUL") end

    local pq = PriorityQueue:new()
    pq:push(14)
    pq:push(2)
    pq:push(7)
    pq:push(17)
    pq:push(-3)

    print(pq, #pq)
    while #pq > 0 do
        print(pq:pop())
    end

    local function shuffle(list)
        for i = 1, #list do
            local p1, p2
            p1 = math.random(1, #list)
            repeat
                p2 = math.random(1, #list)
            until p2 ~= p1
            list[p1], list[p2] = list[p2], list[p1]
        end
    end

    -- Check with list [1..1000] shuffled
    local l = {}
    for i = 1, 1000 do l[i] = i end
    shuffle(l)
    pq = PriorityQueue:new(nil, l)
    for i = 1, 1000 do
        assert(i == pq:pop())
    end
end
