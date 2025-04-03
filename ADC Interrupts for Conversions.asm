; ADC Initialization with Interrupt
LDI     R16, 0x07        ; Set ADC prescaler to 128 (ADC clock 16MHz / 128 = 125KHz)
OUT     ADCSRA, R16      ; Write prescaler to ADC control and status register A

LDI     R16, 0x40        ; Set ADC to use Vcc as reference (default)
OUT     ADMUX, R16       ; Select ADC channel (e.g., ADC0) and reference voltage

; Enable ADC interrupt
SEI                     ; Set global interrupt flag
LDI     R16, 0x80        ; Enable ADC interrupt in ADCSRA
OUT     ADCSRA, R16

; Start the first ADC conversion
SET     ADCSRA, 0x40     ; Set the ADSC bit in ADCSRA to start conversion

; ADC Interrupt Service Routine
ADC_ISR:
IN      R16, ADCL        ; Read low byte of ADC result
IN      R17, ADCH        ; Read high byte of ADC result
; Now R16 and R17 contain the 10-bit ADC result (R16: Low byte, R17: High byte)
RET                       ; Return from interrupt

