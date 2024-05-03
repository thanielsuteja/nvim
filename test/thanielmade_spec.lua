local find_normal_map = function(lhs)
    local maps = vim.api.nvim_get_keymap("n")
    for _, map in ipairs(maps) do
        if map.lhs == lhs then
            return map
        end
    end
end

describe("stackmap", function()
    before_each(function()
        require "custom.plugins.stackmap"._clear()
        pcall(vim.keymap.del, "n", "xix")
    end)

    it("can be required", function()
        require("custom.plugins.stackmap")
    end)

    it("can push a single mapping", function()
        require("custom.plugins.stackmap").push("test1", "n", {
            xix = "echo 'this is a tset'",
        })

        local found = find_normal_map("xix")

        assert.are.same("echo 'this is a tset'", found.rhs)
    end)

    it("can delete mappings after pop: no existing", function()
        require("custom.plugins.stackmap").push("test1", "n", {
            xix = "echo 'this is a tset'",
        })

        local found = find_normal_map("xix")
        assert.are.same("echo 'this is a tset'", found.rhs)

        require("custom.plugins.stackmap").pop("test1")
        local after_pop = find_normal_map("xix")
        assert.are.same(nil, after_pop)
    end)

    it("can delete mappings after pop: yes existing", function()
        vim.keymap.set('n', 'xix', "echo 'something else mate'")

        require("custom.plugins.stackmap").push("test1", "n", {
            xix = "echo 'this is a tset'",
        })

        local found = find_normal_map("xix")
        assert.are.same("echo 'this is a tset'", found.rhs)

        require("custom.plugins.stackmap").pop("test1")
        local after_pop = find_normal_map("xix")
        assert.are.same("echo 'something else mate'", after_pop.rhs)
    end)
end)
