#!/usr/bin/ruby
require 'curses.so'
Curses.init_screen
Curses.noecho
questions = Array.new
answers = Array.new
f = open(ARGV[0], 'r')
while true
  str = f.gets()
  questions.push(str.chop)
  str = f.gets()
  answers.push(str.chop)
  str = f.gets()
  if str == nil then break end
end
f.close()
number = 0
while true
  Curses.init_screen
  Curses.addstr('Q: ' + questions[number] + "\n")
  ch = Curses.getch
  Curses.addstr('A: ')
  i = 0
  answer = answers[number]
  len = answer.length
  while i < len
    Curses.addch(answer[i])
    i += 1
    ch = Curses.getch
	if ch == ?q then exit end
  end
  while true
    ch = Curses.getch
	if ch == ?j then break end
	if ch == ?q then exit end
  end
  number += 1
end
