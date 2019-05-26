##
## EPITECH PROJECT, 2018
## $NAME_OF_THE_PROJECT
## File description:
## Here is coded a super function
##

NAME		=	test
BOARD		=	arduino:avr:uno
CPU			=	#atmega168 #for nano

CC			=	arduino-cli
ifeq ($(CPU),)
	FINAL_BOARD	=	$(BOARD)
else
	FINAL_BOARD	=	$(BOARD):cpu=$(CPU)
endif
PORT		=
BOARD_NAME	=	$(shell echo $(BOARD) | tr ':' '.')
ARDUINOPATH	=	~/Arduino
MYVAR		=	$(shell arduino-cli board list | grep dev | tr '\t' '.' | cut -d '.' -f2 | sed 's/\//\\\//g')

BASENAME	=	$(NAME).$(BOARD_NAME)
HEX			=	$(BASENAME).hex
ELF			=	$(BASENAME).elf

all:	$(HEX)	
	@$(CC) upload -p $(PORT) --fqbn $(FINAL_BOARD) $(ARDUINOPATH)/$(NAME)
	@printf "[\033[0;32muploaded\033[0m] % 29s\n" $(NAME) | tr ' ' '.'

$(HEX):
	@$(CC) compile --fqbn $(FINAL_BOARD) $(ARDUINOPATH)/$(NAME)
	@printf "[\033[0;33mbuilt\033[0m] % 32s\n" $(HEX) | tr ' ' '.'
	@printf "[\033[0;33mcompiled\033[0m] % 29s\n" $(HEX) | tr ' ' '.'

configure:
	@echo "configuring the port"
	@sed  -i 's/^PORT.*/PORT\t\t=\t$(MYVAR)/g' Makefile
	@echo "Port configured"

clean:
	@rm -f $(HEX)
	@printf "[\033[0;31mdeleted\033[0m] % 30s\n" $(HEX) | tr ' ' '.'

fclean: clean
	@rm -f $(ELF)
	@printf "[\033[0;31mdeleted\033[0m] % 30s\n" $(ELF) | tr ' ' '.'

re: fclean all
