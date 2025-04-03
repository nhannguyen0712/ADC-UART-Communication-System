; Function to transmit data via UART (with UDRE check)
UART_Transmit:
LD     R16, DataToSend   ; Load data to send (e.g., ADC result)
WAIT_Transmit:
SBIS    UCSR0A, UDRE      ; Wait for the Transmit Data Register to be empty
RJMP    WAIT_Transmit     ; If not empty, repeat waiting
OUT     UDR0, R16         ; Send the data in UDR0
RET
