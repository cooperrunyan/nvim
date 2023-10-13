local M = {}
local utils = require("utils")

M.banner = {
  [[;                        :                                                           ]],
  [[ED.                      Et                                                          ]],
  [[E#Wi                 ,;  E#t            .,    t#,     L.                            .]],
  [[E###G.             f#i   E##t          ,Wt   ;##W.    EW:        ,ft               ,W]],
  [[E#fD#W;          .E#t    E#W#t        i#D.  :#L:WE    E##;       t#E              i##]],
  [[E#t t##L        i#W,     E#tfL.      f#f   .KG  ,#D   E###t      t#E             f###]],
  [[E#t  .E#K,     L#D.      E#t       .D#i    EE    ;#f  E#fE#f     t#E            G####]],
  [[E#t    j##f  :K#Wfff; ,ffW#Dffj.  :KW,    f#.     t#i E#t D#G    t#E          .K#Ki##]],
  [[E#t    :E#K: i##WLLLLt ;LW#ELLLf. t#f     :#G     GK  E#t  f#E.  t#E         ,W#D.,##]],
  [[E#t   t##L    .E#L       E#t       ;#G     ;#L   LW.  E#t   t#K: t#E        i##E,,i##,]],
  [[E#t .D#W;       f#E:     E#t        :KE.    t#f f#:   E#t    ;#W,t#E       ;DDDDDDE##DGi]],
  [[E#tiW#G.         ,WW;    E#t         .DW:    f#D#;    E#t     :K#D#E              ,##]],
  [[E#K##i            .D#;   E#t           L#,    G#t     E#t      .E##E              ,##]],
  [[E##D.               tt   E#t            jt     t      ..         G#E              .E#]],
  [[E#t                      ;#t                                      fE                t]],
  [[L:                        :;                                       ,                 ]],
}
M.line = 88

-- M.banner = {
-- 	[[███████╗██╗  ██╗ █████╗ ██╗     ██╗         ██╗    ██╗███████╗]],
-- 	[[██╔════╝██║  ██║██╔══██╗██║     ██║         ██║    ██║██╔════╝]],
-- 	[[███████╗███████║███████║██║     ██║         ██║ █╗ ██║█████╗]],
-- 	[[╚════██║██╔══██║██╔══██║██║     ██║         ██║███╗██║██╔══╝]],
-- 	[[███████║██║  ██║██║  ██║███████╗███████╗    ╚███╔███╔╝███████╗]],
-- 	[[╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚══════╝     ╚══╝╚══╝ ╚══════╝]],
-- 	[[]],
-- 	[[██████╗ ██╗      █████╗ ██╗   ██╗     █████╗      ██████╗  █████╗ ███╗   ███╗███████╗██████╗]],
-- 	[[██╔══██╗██║     ██╔══██╗╚██╗ ██╔╝    ██╔══██╗    ██╔════╝ ██╔══██╗████╗ ████║██╔════╝╚════██╗]],
-- 	[[██████╔╝██║     ███████║ ╚████╔╝     ███████║    ██║  ███╗███████║██╔████╔██║█████╗    ▄███╔╝]],
-- 	[[██╔═══╝ ██║     ██╔══██║  ╚██╔╝      ██╔══██║    ██║   ██║██╔══██║██║╚██╔╝██║██╔══╝    ▀▀══╝]],
-- 	[[██║     ███████╗██║  ██║   ██║       ██║  ██║    ╚██████╔╝██║  ██║██║ ╚═╝ ██║███████╗  ██╗]],
-- 	[[╚═╝     ╚══════╝╚═╝  ╚═╝   ╚═╝       ╚═╝  ╚═╝     ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝  ╚═╝,]],
-- }

-- M.banner = {
-- 	[[ ________  ___  ___  ________  ___       ___               ___       __   _______]],
-- 	[[|\   ____\|\  \|\  \|\   __  \|\  \     |\  \             |\  \     |\  \|\  ___ \]],
-- 	[[\ \  \___|\ \  \\\  \ \  \|\  \ \  \    \ \  \            \ \  \    \ \  \ \   __/|]],
-- 	[[ \ \_____  \ \   __  \ \   __  \ \  \    \ \  \            \ \  \  __\ \  \ \  \_|/__]],
-- 	[[  \|____|\  \ \  \ \  \ \  \ \  \ \  \____\ \  \____        \ \  \|\__\_\  \ \  \_|\ \]],
-- 	[[    ____\_\  \ \__\ \__\ \__\ \__\ \_______\ \_______\       \ \____________\ \_______\]],
-- 	[[   |\_________\|__|\|__|\|__|\|__|\|_______|\|_______|        \|____________|\|_______|]],
-- 	[[   \|_________|]],
-- 	[[ ________  ___       ________      ___    ___      ________          ________  ________  _____ ______   _______  ________]],
-- 	[[|\   __  \|\  \     |\   __  \    |\  \  /  /|    |\   __  \        |\   ____\|\   __  \|\   _ \  _   \|\  ___ \|\_____  \]],
-- 	[[\ \  \|\  \ \  \    \ \  \|\  \   \ \  \/  / /    \ \  \|\  \       \ \  \___|\ \  \|\  \ \  \\\__\ \  \ \   __/\|____|\  \]],
-- 	[[ \ \   ____\ \  \    \ \   __  \   \ \    / /      \ \   __  \       \ \  \  __\ \   __  \ \  \\|__| \  \ \  \_|/__   \ \__\]],
-- 	[[  \ \  \___|\ \  \____\ \  \ \  \   \/  /  /        \ \  \ \  \       \ \  \|\  \ \  \ \  \ \  \    \ \  \ \  \_|\ \   \|__|]],
-- 	[[   \ \__\    \ \_______\ \__\ \__\__/  / /           \ \__\ \__\       \ \_______\ \__\ \__\ \__\    \ \__\ \_______\      ___]],
-- 	[[    \|__|     \|_______|\|__|\|__|\___/ /             \|__|\|__|        \|_______|\|__|\|__|\|__|     \|__|\|_______|     |\__\]],
-- 	[[                                 \|___|/                                                                                  \|__|]],
-- }

-- M.banner= {
-- 	[[ ____ ____ ____ ____ ____ _________ ____ ____ _________]],
-- 	[[||S |||H |||A |||L |||L |||       |||W |||E |||       ||]],
-- 	[[||__|||__|||__|||__|||__|||_______|||__|||__|||_______||]],
-- 	[[|/__\|/__\|/__\|/__\|/__\|/_______\|/__\|/__\|/_______\|]],
-- 	[[ ____ ____ ____ ____ _________ ____ _________ ____ ____ ____ ____ ____]],
-- 	[[||P |||L |||A |||Y |||       |||A |||       |||G |||A |||M |||E |||? ||]],
-- 	[[||__|||__|||__|||__|||_______|||__|||_______|||__|||__|||__|||__|||__||]],
-- 	[[|/__\|/__\|/__\|/__\|/_______\|/__\|/_______\|/__\|/__\|/__\|/__\|/__\| ]],
-- }

-- M.banner = {
-- 	[[ ____ ____ ____ ____ ____ _________ ____ ____ ____ ____ ____ ____]],
-- 	[[||H |||E |||L |||L |||O |||       |||J |||O |||S |||H |||U |||A ||]],
-- 	[[||__|||__|||__|||__|||__|||_______|||__|||__|||__|||__|||__|||__||]],
-- 	[[|/__\|/__\|/__\|/__\|/__\|/_______\|/__\|/__\|/__\|/__\|/__\|/__\|]],
-- }

-- M.banner = {
-- 	[[ ___       __   ___  ___  ________  _________        ___  ________           _________  ___  ___  _______]],
-- 	[[|\  \     |\  \|\  \|\  \|\   __  \|\___   ___\     |\  \|\   ____\         |\___   ___\\  \|\  \|\  ___ \]],
-- 	[[\ \  \    \ \  \ \  \\\  \ \  \|\  \|___ \  \_|     \ \  \ \  \___|_        \|___ \  \_\ \  \\\  \ \   __/|]],
-- 	[[ \ \  \  __\ \  \ \   __  \ \   __  \   \ \  \       \ \  \ \_____  \            \ \  \ \ \   __  \ \  \_|/__]],
-- 	[[  \ \  \|\__\_\  \ \  \ \  \ \  \ \  \   \ \  \       \ \  \|____|\  \            \ \  \ \ \  \ \  \ \  \_|\ \]],
-- 	[[   \ \____________\ \__\ \__\ \__\ \__\   \ \__\       \ \__\____\_\  \            \ \__\ \ \__\ \__\ \_______\]],
-- 	[[    \|____________|\|__|\|__|\|__|\|__|    \|__|        \|__|\_________\            \|__|  \|__|\|__|\|_______|]],
-- 	[[                                                            \|_________|]],
-- 	[[]],
-- 	[[]],
-- 	[[ ________  ________  ___  _____ ______   ________  ________      ___    ___      ________  ________  ________  ___  ________]],
-- 	[[|\   __  \|\   __  \|\  \|\   _ \  _   \|\   __  \|\   __  \    |\  \  /  /|    |\   ____\|\   __  \|\   __  \|\  \|\_____  \]],
-- 	[[\ \  \|\  \ \  \|\  \ \  \ \  \\\__\ \  \ \  \|\  \ \  \|\  \   \ \  \/  / /    \ \  \___|\ \  \|\  \ \  \|\  \ \  \|____|\  \]],
-- 	[[ \ \   ____\ \   _  _\ \  \ \  \\|__| \  \ \   __  \ \   _  _\   \ \    / /      \ \  \  __\ \  \\\  \ \   __  \ \  \    \ \__\]],
-- 	[[  \ \  \___|\ \  \\  \\ \  \ \  \    \ \  \ \  \ \  \ \  \\  \|   \/  /  /        \ \  \|\  \ \  \\\  \ \  \ \  \ \  \____\|__|]],
-- 	[[   \ \__\    \ \__\\ _\\ \__\ \__\    \ \__\ \__\ \__\ \__\\ _\ __/  / /           \ \_______\ \_______\ \__\ \__\ \_______\  ___]],
-- 	[[    \|__|     \|__|\|__|\|__|\|__|     \|__|\|__|\|__|\|__|\|__|\___/ /             \|_______|\|_______|\|__|\|__|\|_______| |\__\]],
-- 	[[                                                               \|___|/                                                       \|__|]],
-- }

-- M.banner = {
-- 	[[██╗  ██╗███████╗██╗     ██╗      ██████╗             ██╗ ██████╗ ███████╗██╗  ██╗██╗   ██╗ █████╗]],
-- 	[[██║  ██║██╔════╝██║     ██║     ██╔═══██╗            ██║██╔═══██╗██╔════╝██║  ██║██║   ██║██╔══██╗]],
-- 	[[███████║█████╗  ██║     ██║     ██║   ██║            ██║██║   ██║███████╗███████║██║   ██║███████║]],
-- 	[[██╔══██║██╔══╝  ██║     ██║     ██║   ██║       ██   ██║██║   ██║╚════██║██╔══██║██║   ██║██╔══██║]],
-- 	[[██║  ██║███████╗███████╗███████╗╚██████╔╝▄█╗    ╚█████╔╝╚██████╔╝███████║██║  ██║╚██████╔╝██║  ██║]],
-- 	[[╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝ ╚═════╝ ╚═╝     ╚════╝  ╚═════╝ ╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝]],
-- }

M.quotes = utils.map({
  [[It'd be naive of us, Mr. President, to imagine that these new developments would
cause a change in Soviet expansionist policy. I mean, we must be increasingly on the
alert to prevent them taking over other mine shafts space, in order to breed more
prodigiously than we do. Thus, knocking us out of these superior numbers when we
emerge! Mr. President, we must not allow a mine-shaft gap!]],

  [[Gee, I wish we had one of them doomsday machines.]],
  [[There were those of us who fought against it, but in the end we could not keep up with
the expense involved in the arms race, the space race, and the peace race. At the same
time our people grumbled for more nylons and washing machines. Our doomsday scheme cost
us just a small fraction of what we had been spending on defense in a single year. The
deciding factor was when we learned that your country was working along similar lines,
and we were afraid of a doomsday gap.]],
  [[I don't know exactly how to put this, sir, but are you aware of what a serious breach of
security that would be? I mean, he'll see everything, he'll... he'll see the Big Board!]],
  [[Gentlemen, you can't fight in here! This is the War Room.]],
  [[I don't think my father, the inventor of Toaster Strudel, would be too pleased
to hear about this.]],

  [[Gretchen, stop trying to make *fetch* happen. It's not going to happen!]],

  [[I wanna go fast!]],

  [[Always remember, if you ain't first, you're last.]],
  [[I’m the best there is. Plain and simple. I mean I wake up in the morning, I piss
excellence.]],

  [[Dear Eight Pound, Six Ounce, Newborn Infant Jesus, don't even know a word yet, just a
little infant, so cuddly, but still omnipotent. We just thank you for all the races
I've won and the $21.2 million dollars that I have accrued over this past season. Also
due to a binding endorsement contract that stipulates I mention Powerade at each grace,
I just wanna say that Powerade is delicious and it cools you off on a hot summer day
and we look forward to Powerade's release of mystic mountain blueberry. Thank you, for
all your power and your grace, Dear Baby God, Amen.]],

  [[David, how did that make you feel?
I know my truth.]],

  [[What we need to do now is get focused and stop pointing fingers. You're a problem.
You're a real, real problem.]],

  [[I'm like a peacock, you gotta let me fly!]],
  [[OK, first off: a lion, swimming in the ocean. Lions don't like water. If you placed it
near a river or some sort of fresh water source, that make sense. But you find yourself
in the ocean, 20 foot wave, I'm assuming off the coast of South Africa, coming up
against a full grown 800 pound tuna with his 20 or 30 friends, you lose that battle,
you lose that battle 9 times out of 10. And guess what, you've wandered into our school
of tuna and we now have a taste of lion. We've talked to ourselves. We've communicated
and said 'You know what, lion tastes good, let's go get some more lion'. We've developed
a system to establish a beach-head and aggressively hunt  you and your family and we
will corner your pride, your children, your offspring. We will construct a series of
breathing apparatus with kelp. We will be able to trap certain amounts of oxygen. It's
not gonna be days at a time. An hour? Hour forty-five? No problem. That will give us
enough time to figure out where you live, go back to the sea, get some more oxygen,
and stalk you. You just lost at your own game. You're outgunned and out-manned.]],
  [[At age 11, I audited my parents. Believe me, there were some discrepancies, and I was
grounded.]],

  [[You should have never let us make bunk beds! It was a terrible idea! There’s blood
everywhere! Dad, Nancy, it’s so bad. There’s blood everywhere. Those bunk beds were a
terrible idea. Why’d you let us do that? It’s so bad!]],
  [[I'm very important. I have many leather-bound books and my apartment smells of rich
mahogany.]],

  [[I know who I am. I'm the dude playin' the dude, disguised as another dude!]],
  [[Now, I may be an idiot, but there's one thing I am not sir, and that, sir, is an
idiot.]],

  [[This is a man who thinks the plural of goose is sheep.]],

  [[Chemistry's the one with the shapes... right?]],
  [[Hello 911? Please send the police right away! This guy took my teddy bear! Hello?
Hello?]],
  [[I'm about to do to you what Limp Bizkit did to music in the late '90s.]],
  [[It's not a man purse. It's called a satchel. Indiana Jones wears one.]],
  [[That's why her hair is so big. It's full of secrets.]],
  [[Leave the gun. Take the cannoli.]],
  [[Doth mother know you weareth her drapes?]],
  [[Whoever said orange is the new pink was seriously disturbed.]],
  [[I love the smell of napalm in the morning.]],
  [[So what Jefferson was saying was "Hey! You know, we left this England place because
it was bogus. So if we don't get some cool rules ourselves, pronto, we'll just be bogus
too." Yeah?]],
  [[You don't want the truth because deep down in places you don't talk about at parties,
you want me on that wall, you need me on that wall. We use words like "honor," "code,"
"loyalty." We use these words as the backbone of a life spent defending something. You
use them as a punch line. I have neither the time nor the inclination to explain myself
to a man who rises and sleeps under the blanket of the very freedom that I provide and
then questions the manner in which I provide it. I would rather that you just said
"thank you" and went on your way. Otherwise, I suggest you pick up a weapon and stand
the post. Either way, I don't give a damn what you think you're entitled to!]],
  [[The greatest trick the Devil ever pulled was convincing the world he didn't exist.]],
  [[I have nipples, Greg. Could you milk me?]],
  [[Whenever possible, put on side 1 of Led Zeppelin IV.]],
  [[You're so money, and you don't even know it.]],
  [[The older you do get, the more rules they're gonna try to get you to follow. You just
gotta keep livin' man, L-I-V-I-N.]],
  [[Exercise gives you endorphins. Endorphins make you happy. Happy people just don't shoot
their husbands. They just don't.]],
  [[Nobody makes me bleed my own blood - nobody!]],
  [[Calling somebody else fat won't make you any skinnier. Calling someone stupid doesn't
make you any smarter. And ruining Regina George's life definitely didn't make me any
happier. All you can do in life is try to solve the problem in front of you.]],
  [[When you decide to be somethin', you can be it. That's what they don't tell ya in the
church. When I was your age they would say we could become cops or criminals. Today, what
I'm sayin' is this: when you're facin' a loaded gun, what's the difference?]],
  [[I'm the guy who does his job. You must be the other guy.]],
  [['Bingo!' How fun! But, I digress. Where were we?]],
  [[What is the most resilient parasite? Bacteria? A virus? An intestinal worm?...An idea.
Resilient, highly contagious. Once an idea has taken hold of the brain, it's almost
impossible to eradicate. An idea that is fully formed - fully understood - that sticks.
Right in there somewhere.]],
  [[Hardest time to lie to somebody is when they’re expecting to be lied to.]],
  [[Life is an endless series of train wrecks with only brief commercial-like breaks of
happiness.]],
})

return M
