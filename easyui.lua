EasyUI = {}
EasyUI.buttons = {}

function EasyUI:createButton(properties)
    local button = {
        x = properties.x or 0,
        y = properties.y or 0,
        width = properties.width or 100,
        height = properties.height or 50,
        text = properties.text or "Button",
        bgColor = properties.bgColor or tocolor(50, 50, 50, 200),
        hoverColor = properties.hoverColor or tocolor(70, 70, 70, 200),
        textColor = properties.textColor or tocolor(255, 255, 255, 255),
        onClick = properties.onClick,
        isHovered = false
    }

    table.insert(self.buttons, button)
end

function EasyUI:render()
    for _, button in ipairs(self.buttons) do
        local mx, my = getCursorPosition()
        if mx and my then
            local screenWidth, screenHeight = guiGetScreenSize()
            mx, my = mx * screenWidth, my * screenHeight

            button.isHovered = mx >= button.x and mx <= button.x + button.width and my >= button.y and my <= button.y + button.height
        else
            button.isHovered = false
        end

        local currentColor = button.isHovered and button.hoverColor or button.bgColor
        dxDrawRectangle(button.x, button.y, button.width, button.height, currentColor)
        dxDrawText(button.text, button.x, button.y, button.x + button.width, button.y + button.height, button.textColor, 1, "default-bold", "center", "center")
    end
end

function EasyUI:handleClick(button, state)
    if button == "left" and state == "down" then
        local mx, my = getCursorPosition()
        if mx and my then
            local screenWidth, screenHeight = guiGetScreenSize()
            mx, my = mx * screenWidth, my * screenHeight

            for _, btn in ipairs(self.buttons) do
                if mx >= btn.x and mx <= btn.x + btn.width and my >= btn.y and my <= btn.y + btn.height then
                    if btn.onClick then
                        btn.onClick()
                    end
                end
            end
        end
    end
end