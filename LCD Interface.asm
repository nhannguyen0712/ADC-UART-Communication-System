
LDI     R16, 0xFF        ; Set PORTB to output
OUT     DDRB, R16
LDI     R16, 0x03        ; Set PC0 (RS) and PC1 (E) to output
OUT     DDRC, R16

; Initialize LCD
LDI     R16, 0x38        ; Function set: 8-bit, 2 lines, 5x8 dots
RCALL   LCD_Command
LDI     R16, 0x0C        ; Display ON, Cursor OFF, Blink OFF
RCALL   LCD_Command
LDI     R16, 0x01        ; Clear display
RCALL   LCD_Command

; Function to send command to LCD
LCD_Command:
OUT     PORTB, R16       ; Send command to LCD data pins (PORTB)
LDI     R17, 0xFE        ; Control pin to send command (RS = 0)
OUT     PORTC, R17       ; Set RS to 0 for command mode
LDI     R17, 0x01        ; Set E to 1
OUT     PORTC, R17
NOP                      ; Wait for a brief moment for data to stabilize
NOP
LDI     R17, 0x00        ; Set E to 0 (latch command)
OUT     PORTC, R17
NOP
NOP
RET

; Function to send data to LCD
LCD_Data:
OUT     PORTB, R16       ; Send data to LCD data pins (PORTB)
LDI     R17, 0xFF        ; Control pin to send data (RS = 1)
OUT     PORTC, R17       ; Set RS to 1 for data mode
LDI     R17, 0x01        ; Set E to 1
OUT     PORTC, R17
NOP                      ; Wait for a brief moment for data to stabilize
NOP
LDI     R17, 0x00        ; Set E to 0 (latch data)
OUT     PORTC, R17
NOP
NOP
RET
