local Fizzbuzz = {}
Fizzbuzz.__index = Fizzbuzz

function Fizzbuzz.new()
    return setmetatable(
        {
            Conditions = {},
            OutputString = ""
        },
        Fizzbuzz
    )
end

function Fizzbuzz:AddCondition(Number, Output)
    self.Conditions[Number] = Output
    self.OutputString = self.OutputString .. Output
    return self
end

function Fizzbuzz:VerifyAllConditions(Number)
    for Index, Value in pairs(self.Conditions) do
        if Number % Index ~= 0 then
            return false
        end
    end
    
    return true
end

function Fizzbuzz:GetOutput(Start, End)
    local Output = ""
    
    for Integer = Start, End do
        if self:VerifyAllConditions(Integer) then
            Output = Output .. ("%s %s\n"):format(Integer, self.OutputString)
            continue
        end
        
        for Index, Value in pairs(self.Conditions) do
            if Integer % Index == 0 then
                Output = Output .. ("%s %s\n"):format(Integer, Value)
                break
            end
        end
        
        Output = Output .. ("%s\n"):format(Integer) 
    end
    
    return Output;
end

return Fizzbuzz
