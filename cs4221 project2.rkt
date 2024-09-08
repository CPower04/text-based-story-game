#lang racket

;game was tested by putting false inputs into the function to aee what it gave back, tessting was also done on the choices 


;(define max-choices 8)  first idea to  set the maximum number of choices,


(define (start-game);function that starts game
  (displayln "Welcome to the Tower of Eternity! (please type the words inside the commas to use as your choice for each turn)\n")
  (newline)
  (play-scenario-0 0))



;condition i used to try and set max number of turns
;(define (play-game choice-count)
  ;(cond
    ;((= choice-count max-choices)
     ;(display "You've reached the maximum number of choices. Game over!\n"))
      ;((> choice-count 8)
     ;(display "You've exceeded the turn limit. Game over!\n"))
    ;(else
     ;(play-scenario-0 choice-count ))))



(define (play-scenario-0 choice-count   )
  (cond;condition that checks turns, is in each "play-scenario"
    ((> choice-count 8)
     (display "You've exceeded the turn limit. Game over!\n"))
    
    (else
     (displayln (string-append "You stumble upon the Tower of Eternity, escape the Tower within 8 turns or be trapped for eternity. You are in a small dark room with 2 doors. Do you want to go in the 'gold' door or 'bronze' door? (Turn " (number->string choice-count) ") "))
     (let ((choice (read-line)))
       (cond
         ((string=? choice "gold") (play-scenario-1 (+ choice-count 1) ));moves players to next scenario based on choice and adds +1 to counter
         ((string=? choice "bronze") (play-scenario-2 (+ choice-count 1)  ))
         (else
          (displayln "Invalid choice. Please enter 'gold' or 'bronze'.\n"); only allows users to enter required words
          (play-scenario-0 choice-count  )))))));brings players back to required scenario

(define (play-scenario-1 choice-count)
  (cond
    ((> choice-count 8)
     (displayln "You've exceeded the turn limit. Game over!\n"))
    
    (else
  (displayln (string-append "You discover a large corridor,the corridor is empty except for a  large gold statue of a knight. Do you 'inspect' the statue or 'continue' to the next floor.  (Turn " (number->string choice-count) ") "))
  (let ((choice (read-line)))
    (cond
      ((string=? choice "inspect") (play-scenario-1a (+ choice-count 1)))
      ((string=? choice "continue") (play-scenario-1b (+ choice-count 1)) )
      (else
       (displayln "Invalid choice. Please enter 'Inspect' or 'continue'.\n")
       (play-scenario-1 choice-count)))))))


(define (play-scenario-1a choice-count)
  (cond
    ((> choice-count 8)
     (displayln "You've exceeded the turn limit. Game over!\n"))
  
    (else
  (displayln (string-append "You inspect the statue and find a button on its gold chestplate.Do you press the 'button' or 'continue' to the next floor?  (Turn " (number->string choice-count) ") "))
  (let ((choice (read-line)))
    (cond
      ((string=? choice "button") (play-scenario-1a1 (+ choice-count 1)))
      ((string=? choice "continue") (play-scenario-1b (+ choice-count 1)))
      (else
       (displayln "Invalid choice. Please enter 'button' or 'continue'.\n")
       (play-scenario-1a choice-count)))))))


(define (play-scenario-1b choice-count)
  (cond
    ((> choice-count 8)
     (displayln "You've exceeded the turn limit. Game over!\n"))
   
    (else
  (displayln (string-append "Upon entering the next floor you are greeted by a nasty looking Goblin.Do you try to 'fight' or 'reason' with the goblin?  (Turn " (number->string choice-count) ") "))
  (let ((choice (read-line)))
    (cond
      ((string=? choice "fight")(display "you are defeated by the goblin and wake up back at the start of the Tower. ") (play-scenario-0 (+ choice-count 1)))
      ((string=? choice "reason") (play-scenario-1b1 (+ choice-count 1)))
      (else
       (displayln "Invalid choice. Please enter 'fight' or 'reason'.\n")
       (play-scenario-1b choice-count)))))))


(define (play-scenario-1a1 choice-count)
  (cond
    ((> choice-count 8)
     (displayln "You've exceeded the turn limit. Game over!\n"))
    (else
  (displayln (string-append "After pressing the button, the statue teleports you to a strange room filled with bones somewhere within the tower, There is an exit behind you however in the middle of the room there is a gem guarded by a chained 3 headed hound .Do you 'exit' the room or attempt to get the 'gem'  ?  (Turn " (number->string choice-count) ") "))
  (let ((choice (read-line)))
    (cond
      ((string=? choice "exit")(display " You exit the room and magically find yourself at the start of the Tower ") (play-scenario-0 (+ choice-count 1)))
      ((string=? choice "gem") (play-scenario-1a2 (+ choice-count 1)))
      (else
       (displayln "Invalid choice. Please enter 'exit' or 'gem'.\n")
       (play-scenario-1a1 choice-count)))))))

(define (play-scenario-1a2 choice-count)
  (cond
    ((> choice-count 8)
     (displayln "You've exceeded the turn limit. Game over!\n"))
    
    (else
  (displayln (string-append  "Approaching towards the 3 headed hound you grab a bone off the floor .Do you 'throw' the bone towards the hound or 'hit' the hound with the bone  ?  (Turn " (number->string choice-count) ") "))
  (let ((choice (read-line)))
    (cond
      ((string=? choice "throw") (play-scenario-1a3 (+ choice-count 1)))
      ((string=? choice "hit") (display " The bone cracks after being swung at the hound,Enraged by this the hound attacks you.......you wake up  at the start of the Tower ") (play-scenario-0 (+ choice-count 1)))
      (else
       (displayln "Invalid choice. Please enter 'throw' or 'hit'.\n")
       (play-scenario-1a2 choice-count)))))))

(define (play-scenario-1a3 choice-count)
  (cond
    ((> choice-count 8)
     (displayln "You've exceeded the turn limit. Game over!\n"))
    
    (else
  (displayln (string-append "Distracted by the bone, you sneak past the 3 headed hound and grab the gem. Upon touching the gem a secret door opens in front of you, you enter inside and see an empty throne room with a crystal ball beside the throne. Do you 'sit' in the Throne or 'look' into the crystal ball (Turn " (number->string choice-count) ") "))
  (let ((choice (read-line)))
    (cond
      ((string=? choice "sit") (display "You become the Towers new Ruler,Bound to the Tower for eternity you will never be able to escape"))
      ((string=? choice "look") (display "  ") (play-scenario-1a4 (+ choice-count 1)))
      (else
       (displayln "Invalid choice. Please enter 'sit' or 'look'.\n")
       (play-scenario-1a3 choice-count)))))))


(define (play-scenario-1a4 choice-count)
  (cond
    ((> choice-count 8)
     (displayln "You've exceeded the turn limit. Game over!\n"))
   
    (else
  (displayln (string-append   "Peering into the crystal ball you see  see a hidden exit of the Tower.Do you  go to the hidden 'exit' or 'sit' in the Throne.  (Turn " (number->string choice-count) ") "))
  (let ((choice (read-line)))
    (cond
      ((string=? choice "sit") (display "You become the Towers new Ruler,Bound to the Tower for eternity you will never be able to escape"))
      ((string=? choice "exit") (display "You successfully escape the Tower of eternity  ") )
      (else
       (displayln "Invalid choice. Please enter 'sit' or 'exit'.\n")
       (play-scenario-1a3 choice-count)))))))

(define (play-scenario-1b1 choice-count)
  (cond
    ((> choice-count 8)
     (displayln "You've exceeded the turn limit. Game over!\n"))
    
    (else
  (displayln (string-append  "You successfully reason with the goblin, surprisingly he can understand you and even speak .Do you 'ask' the goblin how to escape or go to the next 'floor' ? (Turn " (number->string choice-count) ") "))
  (let ((choice (read-line)))
    (cond
      ((string=? choice "ask") (play-scenario-1b2 (+ choice-count 1)))
      ((string=? choice "floor") (play-scenario-1 (+ choice-count 1)))
      (else
       (displayln "Invalid choice. Please enter 'fight' or 'reason'.\n")
       (play-scenario-1b1 choice-count)))))))

(define (play-scenario-1b2 choice-count)
  (cond
    ((> choice-count 8)
     (displayln "You've exceeded the turn limit. Game over!\n"))
    
    (else
  (displayln (string-append  "The Goblin tell you to look for the room with the crystal ball .Do you 'ask' the goblin for more information or go to the next 'floor' ? (Turn " (number->string choice-count) ") "))
  (let ((choice (read-line)))
    (cond
      ((string=? choice "ask") (play-scenario-1b2a (+ choice-count 1)))
      ((string=? choice "floor") (play-scenario-1b3 (+ choice-count 1)))
      (else
       (displayln "Invalid choice. Please enter 'fight' or 'reason'.\n")
       (play-scenario-1b2 choice-count)))))))

(define (play-scenario-1b2a choice-count)
  (cond
    ((> choice-count 8)
     (displayln "You've exceeded the turn limit. Game over!\n"))
   
    (else
  (displayln (string-append  "Upon asking the goblin for more information he tells you to avoid the red book. Go to the next 'floor' ? (Turn " (number->string choice-count) ") "))
  (let ((choice (read-line)))
    (cond
      ((string=? choice "floor") (play-scenario-1b3 (+ choice-count 1)))
      (else
       (displayln "Invalid choice. Please enter 'floor'.\n")
       (play-scenario-1b2a choice-count)))))))


(define (play-scenario-1b3 choice-count)
  (cond
    ((> choice-count 8)
     (displayln "You've exceeded the turn limit. Game over!\n"))
    
    (else
  (displayln (string-append  "You enter a library with only two books, a red book with the emblem of a jester and a blue book with the emblem of a dove .Do you open the 'red' book or do you open the 'blue' book? (Turn " (number->string choice-count) ") "))
  (let ((choice (read-line)))
    (cond
      ((string=? choice "red") (display "You suddenly feel sleepy... you wake back up at the start of the Tower ")(play-scenario-0 (+ choice-count 1)))
      ((string=? choice "blue") (display "You are teleported outiside of the bounds of the tower free again  like a dove." ))
      (else
       (displayln "Invalid choice. Please enter 'red' or 'blue'.\n")
       (play-scenario-1b3 choice-count)))))))


(define (play-scenario-2 choice-count)
  (cond
    ((> choice-count 8)
     (displayln "You've exceeded the turn limit. Game over!\n"))
    (else
  (displayln (string-append  "You open the bronze door and find yourself in a magical garden filled with talking flowers. Do you 'listen' to the flowers or 'explore' further into the garden? (Turn " (number->string choice-count) ") "))
  (let ((choice (read-line)))
    (cond
      ((string=? choice "listen") (play-scenario-2a (+ choice-count 1)))
      ((string=? choice "explore") (play-scenario-2b (+ choice-count 1)))
      (else
       (displayln "Invalid choice. Please enter 'listen' or 'explore'.\n")
       (play-scenario-2 choice-count)))))))

(define (play-scenario-2a choice-count)
  (cond
    ((> choice-count 8)
     (displayln "You've exceeded the turn limit. Game over!\n"))
    
    (else
  (displayln (string-append  "The flowers share their wisdom and reveal a hidden passage covered with vines. Do you 'enter' the hidden passage or 'ignore' their advice and 'explore' further into the garden?  (Turn " (number->string choice-count) ") "))
  (let ((choice (read-line)))
    (cond
      ((string=? choice "enter") (play-scenario-2a1 (+ choice-count 1)))
      ((string=? choice "explore") (play-scenario-2b (+ choice-count 1)))
      (else
       (displayln "Invalid choice. Please enter 'enter' or 'explore'.\n")
       (play-scenario-2a choice-count)))))))

(define (play-scenario-2a1 choice-count)
  (cond
    ((> choice-count 8)
     (displayln "You've exceeded the turn limit. Game over!\n"))
    
    (else
  (displayln (string-append  "You enter the hidden passage and find a magical pond with a 'mirror' that reflects your true desires. Do you 'look' into the mirror or 'continue' exploring?  (Turn " (number->string choice-count) ") "))
  (let ((choice (read-line)))
    (cond
      ((string=? choice "look") (display "You see a vision of the Tower's exit in the mirror. Motivated, you successfully navigate through the Tower and escape!"))
      ((string=? choice "continue") (play-scenario-2b (+ choice-count 1)))
      (else
       (displayln "Invalid choice. Please enter 'look' or 'continue'.\n")
       (play-scenario-2a1 choice-count)))))))

(define (play-scenario-2b  choice-count)
  (cond
    ((> choice-count 8)
     (displayln "You've exceeded the turn limit. Game over!\n"))
    
    (else
  (displayln (string-append  "As you explore further, you encounter a mischievous sprite. Do you 'befriend' the sprite or 'avoid' it? (Turn " (number->string choice-count) ") "))
  (let ((choice (read-line)))
    (cond
      ((string=? choice "befriend") (play-scenario-2b1))
      ((string=? choice "avoid") (play-scenario-2b2 (+ choice-count 1)))
      (else
       (displayln "Invalid choice. Please enter 'befriend' or 'avoid'.\n")
       (play-scenario-2b choice-count)))))))

(define (play-scenario-2b1 )
  (displayln   "The sprite becomes your friend and guides you to a hidden 'portal' that leads to the Tower's exit. Congratulations, you have escaped!  ")
  (newline))

(define (play-scenario-2b2 )
  (displayln   "You decide to avoid the sprite, but it plays tricks on you, leading you in circles. Eventually, you find yourself back at the Tower's entrance. ")
  (play-scenario-0))




(start-game)

