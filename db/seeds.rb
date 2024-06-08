require "open-uri"

Favorite.destroy_all
MemeTag.destroy_all
Tag.destroy_all
Meme.destroy_all
User.destroy_all

# Create users
antoine = User.create!(email: "antoine@gmail.com", nickname: "Brissux", password: "123456")
julien = User.create!(email: "julien@gmail.com", nickname: "Julien", password: "password")
anais = User.create!(email: "anais@gmail.com", nickname: "Anaïs", password: "password")
amin = User.create!(email: "amin@gmail.com", nickname: "Amin", password: "password")

# Create memes with images
meme1 = Meme.new(title: "Alien Theory explication", public: true, user: antoine)
meme1.image.attach(io: URI.open("https://i.imgflip.com/26am.jpg"), filename: 'alien_theory.jpg')
meme1.save

meme2 = Meme.new(title: "Bouton stress", public: true, user: julien)
meme2.image.attach(io: URI.open("https://i.imgflip.com/1g8my4.jpg"), filename: 'bouton_stress.jpg')
meme2.save

meme3 = Meme.new(title: "Cerveau Explosion", public: false, user: anais)
meme3.image.attach(io: URI.open("https://i.imgflip.com/1jwhww.jpg"), filename: 'cerveau_explos.jpg')
meme3.save

meme4 = Meme.new(title: "Drake Dance", public: true, user: amin)
meme4.image.attach(io: URI.open("https://i.imgflip.com/30b1gx.jpg"), filename: 'drake_dance.jpg')
meme4.save

# New memes
meme5 = Meme.new(title: "Homer et Bart dans les escaliers", public: true, user: antoine)
meme5.image.attach(io: URI.open("https://pbs.twimg.com/media/GKgjOCnWwAA7l_B?format=jpg&name=small"), filename: 'homer_bart_stairs.jpg')
meme5.save

meme6 = Meme.new(title: "Among us Impostor", public: false, user: julien)
meme6.image.attach(io: URI.open("https://pbs.twimg.com/media/GKaWGJsXcAA063J?format=jpg&name=large"), filename: 'among_us_impostor.jpg')
meme6.save

meme7 = Meme.new(title: "Snap Mohammed Henni bloqué", public: true, user: anais)
meme7.image.attach(io: URI.open("https://pbs.twimg.com/media/GKPxrp2WcAAYJS5?format=jpg&name=medium"), filename: 'mohammed_henni_blocked.jpg')
meme7.save

meme8 = Meme.new(title: "Pas mal non c'est français", public: true, user: amin)
meme8.image.attach(io: URI.open("https://pbs.twimg.com/media/GKKu9t4WQAAZw2_?format=jpg&name=small"), filename: 'french_class.jpg')
meme8.save

meme9 = Meme.new(title: "Lionel Messi costar", public: true, user: antoine)
meme9.image.attach(io: URI.open("https://pbs.twimg.com/media/GKFta4XW4AAXcDz?format=jpg&name=900x900"), filename: 'messi_costar.jpg')
meme9.save

meme10 = Meme.new(title: "Zinedine Zidane boit son café", public: false, user: julien)
meme10.image.attach(io: URI.open("https://pbs.twimg.com/media/GJ3VlnqXoAEkkVq?format=jpg&name=900x900"), filename: 'zidane_coffee.jpg')
meme10.save

meme11 = Meme.new(title: "Tik tok mec pleure", public: true, user: anais)
meme11.image.attach(io: URI.open("https://pbs.twimg.com/media/GJyT9fMW8AAhByu?format=jpg&name=medium"), filename: 'tiktok_guy_crying.jpg')
meme11.save

meme12 = Meme.new(title: "Merde je me suis cramé tout seul", public: true, user: amin)
meme12.image.attach(io: URI.open("https://pbs.twimg.com/media/GJdB3FfXwAAj7Sg?format=jpg&name=900x900"), filename: 'burnt_myself.jpg')
meme12.save

meme13 = Meme.new(title: "Les Simpson Moe dégage Barney", public: true, user: antoine)
meme13.image.attach(io: URI.open("https://pbs.twimg.com/media/GI5J5fkWEAApTcH?format=jpg&name=medium"), filename: 'moe_kicks_barney.jpg')
meme13.save

meme14 = Meme.new(title: "Snap mauvaise journée", public: false, user: julien)
meme14.image.attach(io: URI.open("https://pbs.twimg.com/media/GI0VGsmWIAA23uK?format=jpg&name=medium"), filename: 'bad_day_snap.jpg')
meme14.save

meme15 = Meme.new(title: "Meme image Neo the one", public: true, user: anais)
meme15.image.attach(io: URI.open("https://pbs.twimg.com/media/GH663NPWkAAnWkU?format=jpg&name=900x900"), filename: 'neo_the_one.jpg')
meme15.save

meme16 = Meme.new(title: "Un avis qui vous mettrait dans cette position", public: true, user: amin)
meme16.image.attach(io: URI.open("https://pbs.twimg.com/media/GH1vy41W4AMyrk4?format=jpg&name=large"), filename: 'opinion_position.jpg')
meme16.save

meme17 = Meme.new(title: "Mickey mouse c'est un outil surprise", public: true, user: antoine)
meme17.image.attach(io: URI.open("https://pbs.twimg.com/media/GHric2OWEAAJCl5?format=jpg&name=small"), filename: 'mickey_tool.jpg')
meme17.save

meme18 = Meme.new(title: "Face à face confrontation", public: false, user: julien)
meme18.image.attach(io: URI.open("https://pbs.twimg.com/media/GGY3cETWYAAva-W?format=jpg&name=small"), filename: 'face_to_face.jpg')
meme18.save

meme19 = Meme.new(title: "Mec qui dit il a pas tort", public: true, user: anais)
meme19.image.attach(io: URI.open("https://pbs.twimg.com/media/GGY3cETWYAAva-W?format=jpg&name=small"), filename: 'guy_not_wrong.jpg')
meme19.save

meme20 = Meme.new(title: "Mec suicide selfie", public: true, user: amin)
meme20.image.attach(io: URI.open("https://pbs.twimg.com/media/GF1-MecW4AAGqo6?format=jpg&name=900x900"), filename: 'suicide_selfie.jpg')
meme20.save

meme21 = Meme.new(title: "Temps gagné tik tok mec", public: true, user: antoine)
meme21.image.attach(io: URI.open("https://pbs.twimg.com/media/GFqkkU1XwAARWCs?format=jpg&name=900x900"), filename: 'time_saved_tiktok.jpg')
meme21.save

meme22 = Meme.new(title: "Shrek l'âne donkey te fixe", public: false, user: julien)
meme22.image.attach(io: URI.open("https://pbs.twimg.com/media/GFlYQ8BWoAAGOQh?format=jpg&name=900x900"), filename: 'shrek_donkey_stare.jpg')
meme22.save

meme23 = Meme.new(title: "Ville futuriste du futur", public: true, user: anais)
meme23.image.attach(io: URI.open("https://pbs.twimg.com/media/GFbhXyxWQAA9qyl?format=jpg&name=900x900"), filename: 'futuristic_city.jpg')
meme23.save

meme24 = Meme.new(title: "Gamin enfant a mangé du caca", public: true, user: amin)
meme24.image.attach(io: URI.open("https://pbs.twimg.com/media/GFQrs0ZXIAAuldA?format=jpg&name=medium"), filename: 'kid_ate_poop.jpg')
meme24.save

meme25 = Meme.new(title: "Anime Akakichi no Eleven mec annonce un truc", public: true, user: antoine)
meme25.image.attach(io: URI.open("https://pbs.twimg.com/media/GDj05z2WoAAharW?format=jpg&name=small"), filename: 'akakichi_announcement.jpg')
meme25.save

meme26 = Meme.new(title: "She's so crazy love her", public: false, user: julien)
meme26.image.attach(io: URI.open("https://pbs.twimg.com/media/Fly2wJCWIAwrfzA?format=jpg&name=small"), filename: 'crazy_love.jpg')
meme26.save

meme27 = Meme.new(title: "Les Simpsons Bart un avis catastrophique", public: true, user: anais)
meme27.image.attach(io: URI.open("https://pbs.twimg.com/media/GFLpW1pWgAAfdV8?format=jpg&name=900x900"), filename: 'bart_catastrophic.jpg')
meme27.save

meme28 = Meme.new(title: "Snap mec choqué il a eu 0/20", public: true, user: amin)
meme28.image.attach(io: URI.open("https://pbs.twimg.com/media/FhE7R9wX0AIB_8j?format=jpg&name=large"), filename: 'snap_shocked_zero.jpg')
meme28.save

meme29 = Meme.new(title: "Il revient Zinedine Zidane", public: true, user: antoine)
meme29.image.attach(io: URI.open("https://pbs.twimg.com/media/FgLxMplWYAIHZDa?format=jpg&name=900x900"), filename: 'zidane_returns.jpg')
meme29.save

meme30 = Meme.new(title: "Narcos solitude ennui", public: false, user: julien)
meme30.image.attach(io: URI.open("https://pbs.twimg.com/media/Eg3T9iNWsAAFhXS?format=jpg&name=small"), filename: 'narcos_boredom.jpg')
meme30.save

meme31 = Meme.new(title: "Bob Razowski Sulli", public: true, user: anais)
meme31.image.attach(io: URI.open("https://pbs.twimg.com/media/EgYAdvrU0AE0UnK?format=jpg&name=900x900"), filename: 'bob_sulli.jpg')
meme31.save

meme32 = Meme.new(title: "Abraham Simpson raconte une histoire", public: true, user: amin)
meme32.image.attach(io: URI.open("https://pbs.twimg.com/media/Eg_sH2IXsAESKuh?format=jpg&name=small"), filename: 'abraham_story.jpg')
meme32.save

meme33 = Meme.new(title: "Chat triste tristesse", public: true, user: antoine)
meme33.image.attach(io: URI.open("https://pbs.twimg.com/media/EhGjGEkXcAIbcfQ?format=jpg&name=small"), filename: 'sad_cat.jpg')
meme33.save

# Create tags
tag_homer = Tag.create!(name: "homer")
tag_bart = Tag.create!(name: "bart")
tag_simpsons = Tag.create!(name: "les simpsons")
tag_escaliers = Tag.create!(name: "escaliers")

tag_among_us = Tag.create!(name: "among us")
tag_impostor = Tag.create!(name: "impostor")
tag_sus = Tag.create!(name: "sus")
tag_suspect = Tag.create!(name: "suspect")

tag_snap = Tag.create!(name: "snap")
tag_mohammed_henni = Tag.create!(name: "mohammed henni")
tag_bloque = Tag.create!(name: "bloqué")
tag_tete_coincee = Tag.create!(name: "tête coincée")
tag_chaise = Tag.create!(name: "chaise")

tag_pas_mal_non = Tag.create!(name: "pas mal non")
tag_francais = Tag.create!(name: "français")
tag_la_classe_americaine = Tag.create!(name: "la classe américaine")
tag_orson_welles = Tag.create!(name: "orson welles")

tag_lionel_messi = Tag.create!(name: "lionel messi")
tag_costar = Tag.create!(name: "costar")
tag_joueur_de_foot = Tag.create!(name: "joueur de foot")
tag_selfie = Tag.create!(name: "selfie")

tag_zinedine_zidane = Tag.create!(name: "zinedine zidane")
tag_cafe = Tag.create!(name: "café")
tag_sourire = Tag.create!(name: "sourire")

tag_tik_tok = Tag.create!(name: "tik tok")
tag_mec = Tag.create!(name: "mec")
tag_pleure = Tag.create!(name: "pleure")
tag_crying = Tag.create!(name: "crying")

tag_merde = Tag.create!(name: "merde")
tag_crame = Tag.create!(name: "cramé")
tag_gamemix = Tag.create!(name: "gamemix")
tag_treize = Tag.create!(name: "treize")
tag_video_miniature = Tag.create!(name: "vidéo miniature")
tag_youtube = Tag.create!(name: "youtube")

tag_les_simpson = Tag.create!(name: "les simpson")
tag_moe = Tag.create!(name: "moe")
tag_barney = Tag.create!(name: "barney")
tag_degage = Tag.create!(name: "dégage")
tag_bar = Tag.create!(name: "bar")

tag_mauvaise_journee = Tag.create!(name: "mauvaise journée")
tag_soucis = Tag.create!(name: "soucis")
tag_negatif = Tag.create!(name: "négatif")

tag_meme_image = Tag.create!(name: "meme image")
tag_neo_the_one = Tag.create!(name: "neo the one")
tag_verite = Tag.create!(name: "vérité")
tag_avis = Tag.create!(name: "avis")
tag_risque = Tag.create!(name: "risque")

tag_avis_position = Tag.create!(name: "avis position")
tag_sabres = Tag.create!(name: "sabres")
tag_epées = Tag.create!(name: "épées")
tag_raiponce = Tag.create!(name: "raiponce")

tag_mickey_mouse = Tag.create!(name: "mickey mouse")
tag_outil_surprise = Tag.create!(name: "outil surprise")
tag_dessin_anime = Tag.create!(name: "dessin animé")
tag_enfant = Tag.create!(name: "enfant")

tag_face_a_face = Tag.create!(name: "face à face")
tag_confrontation = Tag.create!(name: "confrontation")
tag_t_shirts_rouge_bleu = Tag.create!(name: "t-shirts rouge et bleu")
tag_gros_ventre = Tag.create!(name: "gros ventre")

tag_suicide = Tag.create!(name: "suicide")
tag_gun = Tag.create!(name: "gun")

tag_temps_gagne = Tag.create!(name: "temps gagné")
tag_resume = Tag.create!(name: "résume")

tag_shrek = Tag.create!(name: "shrek")
tag_l_ane = Tag.create!(name: "l'âne")
tag_donkey = Tag.create!(name: "donkey")
tag_fixe = Tag.create!(name: "fixe")
tag_regard_bizarre = Tag.create!(name: "regard bizarre")

tag_ville_futuriste = Tag.create!(name: "ville futuriste")
tag_futur = Tag.create!(name: "futur")
tag_monde = Tag.create!(name: "monde")
tag_humanite = Tag.create!(name: "humanité")

tag_gamin = Tag.create!(name: "gamin")
tag_enfant_mange_caca = Tag.create!(name: "enfant a mangé du caca")

tag_akakichi_no_eleven = Tag.create!(name: "akakichi no eleven")
tag_annonce = Tag.create!(name: "annonce")

tag_she_s_so_crazy = Tag.create!(name: "she's so crazy")
tag_love_her = Tag.create!(name: "love her")
tag_folle = Tag.create!(name: "folle")
tag_dejantee = Tag.create!(name: "déjantée")

tag_un_avis = Tag.create!(name: "un avis")
tag_mettre_position = Tag.create!(name: "mettrait dans cette position")

tag_narcos = Tag.create!(name: "narcos")
tag_solitude = Tag.create!(name: "solitude")
tag_ennui = Tag.create!(name: "ennui")
tag_pablo_escobar = Tag.create!(name: "pablo escobar")

tag_bob_razowski = Tag.create!(name: "bob razowski")
tag_sulli = Tag.create!(name: "sulli")
tag_sullivan = Tag.create!(name: "sullivan")
tag_monstres_et_cie = Tag.create!(name: "monstres et cie")

tag_abraham_simpson = Tag.create!(name: "abraham simpson")
tag_raconte = Tag.create!(name: "raconte")
tag_histoire = Tag.create!(name: "histoire")

tag_chat = Tag.create!(name: "chat")
tag_triste = Tag.create!(name: "triste")
tag_tristesse = Tag.create!(name: "tristesse")

# Create meme_tags
# Associer les mèmes aux tags
MemeTag.create!(meme: meme5, tag: tag_homer)
MemeTag.create!(meme: meme5, tag: tag_bart)
MemeTag.create!(meme: meme5, tag: tag_simpsons)
MemeTag.create!(meme: meme5, tag: tag_escaliers)

MemeTag.create!(meme: meme6, tag: tag_among_us)
MemeTag.create!(meme: meme6, tag: tag_impostor)
MemeTag.create!(meme: meme6, tag: tag_sus)
MemeTag.create!(meme: meme6, tag: tag_suspect)

MemeTag.create!(meme: meme7, tag: tag_snap)
MemeTag.create!(meme: meme7, tag: tag_mohammed_henni)
MemeTag.create!(meme: meme7, tag: tag_bloque)
MemeTag.create!(meme: meme7, tag: tag_tete_coincee)
MemeTag.create!(meme: meme7, tag: tag_chaise)

MemeTag.create!(meme: meme8, tag: tag_pas_mal_non)
MemeTag.create!(meme: meme8, tag: tag_francais)
MemeTag.create!(meme: meme8, tag: tag_la_classe_americaine)
MemeTag.create!(meme: meme8, tag: tag_orson_welles)

MemeTag.create!(meme: meme9, tag: tag_lionel_messi)
MemeTag.create!(meme: meme9, tag: tag_costar)
MemeTag.create!(meme: meme9, tag: tag_joueur_de_foot)
MemeTag.create!(meme: meme9, tag: tag_selfie)

MemeTag.create!(meme: meme10, tag: tag_zinedine_zidane)
MemeTag.create!(meme: meme10, tag: tag_cafe)
MemeTag.create!(meme: meme10, tag: tag_sourire)

MemeTag.create!(meme: meme11, tag: tag_tik_tok)
MemeTag.create!(meme: meme11, tag: tag_mec)
MemeTag.create!(meme: meme11, tag: tag_pleure)
MemeTag.create!(meme: meme11, tag: tag_crying)

MemeTag.create!(meme: meme12, tag: tag_merde)
MemeTag.create!(meme: meme12, tag: tag_crame)
MemeTag.create!(meme: meme12, tag: tag_gamemix)
MemeTag.create!(meme: meme12, tag: tag_treize)
MemeTag.create!(meme: meme12, tag: tag_video_miniature)
MemeTag.create!(meme: meme12, tag: tag_youtube)

MemeTag.create!(meme: meme13, tag: tag_les_simpson)
MemeTag.create!(meme: meme13, tag: tag_moe)
MemeTag.create!(meme: meme13, tag: tag_barney)
MemeTag.create!(meme: meme13, tag: tag_degage)
MemeTag.create!(meme: meme13, tag: tag_bar)

MemeTag.create!(meme: meme14, tag: tag_snap)
MemeTag.create!(meme: meme14, tag: tag_mauvaise_journee)
MemeTag.create!(meme: meme14, tag: tag_soucis)
MemeTag.create!(meme: meme14, tag: tag_negatif)

MemeTag.create!(meme: meme15, tag: tag_meme_image)
MemeTag.create!(meme: meme15, tag: tag_neo_the_one)
MemeTag.create!(meme: meme15, tag: tag_verite)
MemeTag.create!(meme: meme15, tag: tag_avis)
MemeTag.create!(meme: meme15, tag: tag_risque)

MemeTag.create!(meme: meme16, tag: tag_avis_position)
MemeTag.create!(meme: meme16, tag: tag_sabres)
MemeTag.create!(meme: meme16, tag: tag_epées)
MemeTag.create!(meme: meme16, tag: tag_raiponce)

MemeTag.create!(meme: meme17, tag: tag_mickey_mouse)
MemeTag.create!(meme: meme17, tag: tag_outil_surprise)
MemeTag.create!(meme: meme17, tag: tag_dessin_anime)
MemeTag.create!(meme: meme17, tag: tag_enfant)

MemeTag.create!(meme: meme18, tag: tag_face_a_face)
MemeTag.create!(meme: meme18, tag: tag_confrontation)
MemeTag.create!(meme: meme18, tag: tag_t_shirts_rouge_bleu)
MemeTag.create!(meme: meme18, tag: tag_gros_ventre)

MemeTag.create!(meme: meme19, tag: tag_mec)
MemeTag.create!(meme: meme19, tag: tag_avis)
MemeTag.create!(meme: meme19, tag: tag_risque)

MemeTag.create!(meme: meme20, tag: tag_mec)
MemeTag.create!(meme: meme20, tag: tag_suicide)
MemeTag.create!(meme: meme20, tag: tag_selfie)
MemeTag.create!(meme: meme20, tag: tag_sourire)
MemeTag.create!(meme: meme20, tag: tag_gun)

MemeTag.create!(meme: meme21, tag: tag_temps_gagne)
MemeTag.create!(meme: meme21, tag: tag_tik_tok)
MemeTag.create!(meme: meme21, tag: tag_resume)

MemeTag.create!(meme: meme22, tag: tag_shrek)
MemeTag.create!(meme: meme22, tag: tag_l_ane)
MemeTag.create!(meme: meme22, tag: tag_donkey)
MemeTag.create!(meme: meme22, tag: tag_fixe)
MemeTag.create!(meme: meme22, tag: tag_regard_bizarre)

MemeTag.create!(meme: meme23, tag: tag_ville_futuriste)
MemeTag.create!(meme: meme23, tag: tag_futur)
MemeTag.create!(meme: meme23, tag: tag_monde)
MemeTag.create!(meme: meme23, tag: tag_humanite)

MemeTag.create!(meme: meme24, tag: tag_gamin)
MemeTag.create!(meme: meme24, tag: tag_enfant_mange_caca)
MemeTag.create!(meme: meme24, tag: tag_dessin_anime)

MemeTag.create!(meme: meme25, tag: tag_meme_image)
MemeTag.create!(meme: meme25, tag: tag_akakichi_no_eleven)
MemeTag.create!(meme: meme25, tag: tag_mec)
MemeTag.create!(meme: meme25, tag: tag_annonce)

MemeTag.create!(meme: meme26, tag: tag_meme_image)
MemeTag.create!(meme: meme26, tag: tag_she_s_so_crazy)
MemeTag.create!(meme: meme26, tag: tag_love_her)
MemeTag.create!(meme: meme26, tag: tag_folle)
MemeTag.create!(meme: meme26, tag: tag_dejantee)

MemeTag.create!(meme: meme27, tag: tag_meme_image)
MemeTag.create!(meme: meme27, tag: tag_les_simpson)
MemeTag.create!(meme: meme27, tag: tag_bart)
MemeTag.create!(meme: meme27, tag: tag_avis)

MemeTag.create!(meme: meme28, tag: tag_snap)
MemeTag.create!(meme: meme28, tag: tag_mec)

MemeTag.create!(meme: meme29, tag: tag_zinedine_zidane)

MemeTag.create!(meme: meme30, tag: tag_narcos)
MemeTag.create!(meme: meme30, tag: tag_solitude)
MemeTag.create!(meme: meme30, tag: tag_ennui)
MemeTag.create!(meme: meme30, tag: tag_pablo_escobar)

MemeTag.create!(meme: meme31, tag: tag_bob_razowski)
MemeTag.create!(meme: meme31, tag: tag_sulli)
MemeTag.create!(meme: meme31, tag: tag_sullivan)
MemeTag.create!(meme: meme31, tag: tag_monstres_et_cie)

MemeTag.create!(meme: meme32, tag: tag_abraham_simpson)
MemeTag.create!(meme: meme32, tag: tag_les_simpson)
MemeTag.create!(meme: meme32, tag: tag_histoire)
MemeTag.create!(meme: meme32, tag: tag_raconte)

MemeTag.create!(meme: meme33, tag: tag_chat)
MemeTag.create!(meme: meme33, tag: tag_triste)
MemeTag.create!(meme: meme33, tag: tag_tristesse)

# Create favorites
Favorite.create!(user: antoine, meme: meme2) # Antoine likes Bouton stress
Favorite.create!(user: julien, meme: meme1) # Julien likes Alien Theory explication
Favorite.create!(user: anais, meme: meme4) # Anaïs likes Drake Dance
Favorite.create!(user: amin, meme: meme3) # Amin likes Cerveau Explosion

# New favorites
Favorite.create!(user: antoine, meme: meme6) # Antoine likes Among us Impostor
Favorite.create!(user: julien, meme: meme5) # Julien likes Homer et Bart dans les escaliers
Favorite.create!(user: anais, meme: meme9) # Anaïs likes Lionel Messi costar
Favorite.create!(user: amin, meme: meme8) # Amin likes Pas mal non c'est français
Favorite.create!(user: julien, meme: meme10) # Julien likes Zinedine Zidane boit son café
Favorite.create!(user: antoine, meme: meme11) # Antoine likes Tik tok mec pleure
Favorite.create!(user: anais, meme: meme12) # Anaïs likes Merde je me suis cramé tout seul
Favorite.create!(user: amin, meme: meme14) # Amin likes Snap mauvaise journée
Favorite.create!(user: julien, meme: meme15) # Julien likes Meme image Neo the one
Favorite.create!(user: antoine, meme: meme18) # Antoine likes Un avis qui vous mettrait dans cette position
Favorite.create!(user: anais, meme: meme19) # Anaïs likes Mickey mouse c'est un outil surprise
Favorite.create!(user: amin, meme: meme20) # Amin likes Face à face confrontation
Favorite.create!(user: julien, meme: meme22) # Julien likes Mec qui dit il a pas tort
Favorite.create!(user: antoine, meme: meme24) # Antoine likes Mec suicide selfie
Favorite.create!(user: anais, meme: meme25) # Anaïs likes Temps gagné tik tok mec
Favorite.create!(user: amin, meme: meme27) # Amin likes Shrek l'âne donkey te fixe
Favorite.create!(user: julien, meme: meme28) # Julien likes Ville futuriste du futur
Favorite.create!(user: antoine, meme: meme29) # Antoine likes Gamin enfant a mangé du caca
Favorite.create!(user: anais, meme: meme30) # Anaïs likes Anime Akakichi no Eleven mec annonce un truc
Favorite.create!(user: amin, meme: meme32) # Amin likes She's so crazy love her
Favorite.create!(user: julien, meme: meme33) # Julien likes Les Simpsons Bart un avis catastrophique

puts "Seeding completed!"
