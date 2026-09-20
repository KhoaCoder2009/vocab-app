-- BATCH 3 | BAND 1.0 | TOPIC: Friends & Relationships | PART: Core Vocabulary | NUMBER OF WORDS: 30 | CEFR: A1
-- Gợi ý: nên có unique index (set_id, word) để "on conflict do nothing" chống trùng khi chạy lại:
-- create unique index if not exists vocabularies_set_word_uidx on public.vocabularies (set_id, lower(word));

do $$
declare
  v_set_id uuid;
begin
  select id into v_set_id
  from public.vocabulary_sets
  where title = 'IELTS Band 1: Friends & Relationships' and owner_id is null
  limit 1;

  if v_set_id is null then
    insert into public.vocabulary_sets
      (owner_id, title, description, difficulty, is_public, cover_color)
    values
      (null, 'IELTS Band 1: Friends & Relationships',
       'Từ vựng IELTS chủ đề Friends & Relationships cho Band 1: bạn bè, cảm xúc và giao tiếp lịch sự cơ bản.',
       'easy', true, 'green')
    on conflict do nothing
    returning id into v_set_id;
  end if;

  if v_set_id is null then
    select id into v_set_id from public.vocabulary_sets where title = 'IELTS Band 1: Friends & Relationships' limit 1;
  end if;


  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'friend', 'bạn bè', 'a person you know well and like', 'noun', '/frend/',
     'My friend helps me with English.', 'Bạn tôi giúp tôi học tiếng Anh.',
     1.0, 'Friends & Relationships', 'A1', 'Speaking Part 1 (Friends).',
     array['Speaking', 'Listening'],
     array['close friend', 'best friend', 'make friends'],
     array['pal', 'companion'],
     array['enemy'],
     array['friendly', 'friendship', 'friendless'],
     'Make friends là cụm rất hay dùng trong Speaking.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'neighbour', 'hàng xóm', 'a person who lives near you', 'noun', '/ˈneɪbər/',
     'Our neighbour is a friendly old man.', 'Hàng xóm của chúng tôi là một ông cụ thân thiện.',
     1.0, 'Friends & Relationships', 'A1', 'Speaking Part 1 (Home).',
     array['Speaking', 'Listening'],
     array['next-door neighbour', 'friendly neighbour', 'good neighbour'],
     array[]::text[],
     array[]::text[],
     array['neighbourhood', 'neighbouring'],
     'Anh-Mỹ viết neighbor.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'classmate', 'bạn cùng lớp', 'a student in the same class as you', 'noun', '/ˈklæsmeɪt/',
     'My classmates are very helpful.', 'Các bạn cùng lớp của tôi rất hay giúp đỡ.',
     1.0, 'Friends & Relationships', 'A1', 'Speaking Part 1 (School).',
     array['Speaking', 'Listening'],
     array['my classmate', 'classmate and friend', 'new classmate'],
     array['schoolmate'],
     array[]::text[],
     array['class', 'mate'],
     'Classmate chỉ người học cùng lớp, không nhất thiết là bạn thân.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'boyfriend', 'bạn trai', 'a man or boy in a romantic relationship with you', 'noun', '/ˈbɔɪfrend/',
     'Her boyfriend is very polite.', 'Bạn trai cô ấy rất lịch sự.',
     1.0, 'Friends & Relationships', 'A1', 'Speaking Part 1 (Relationships).',
     array['Speaking', 'Listening'],
     array['have a boyfriend', 'her boyfriend', 'new boyfriend'],
     array[]::text[],
     array['girlfriend'],
     array['boy', 'friend'],
     'Ít dùng trong Writing học thuật.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'girlfriend', 'bạn gái', 'a woman or girl in a romantic relationship with you', 'noun', '/ˈɡɜːrlfrend/',
     'He has a new girlfriend.', 'Anh ấy có bạn gái mới.',
     1.0, 'Friends & Relationships', 'A1', 'Speaking Part 1 (Relationships).',
     array['Speaking', 'Listening'],
     array['have a girlfriend', 'his girlfriend', 'new girlfriend'],
     array[]::text[],
     array['boyfriend'],
     array['girl', 'friend'],
     'Không nhầm với girl friend (bạn nữ) khi viết tách rời.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'meet', 'gặp gỡ', 'to see and talk to someone', 'verb', '/miːt/',
     'I meet my friends every weekend.', 'Tôi gặp bạn bè vào mỗi cuối tuần.',
     1.0, 'Friends & Relationships', 'A1', 'Speaking Part 1 (Friends).',
     array['Speaking', 'Listening'],
     array['meet friends', 'meet up', 'nice to meet you'],
     array['see', 'get together'],
     array[]::text[],
     array['meeting'],
     'Meet up là cụm hội thoại rất tự nhiên.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'talk', 'nói chuyện', 'to speak with someone', 'verb', '/tɔːk/',
     'We talk about school after class.', 'Chúng tôi nói chuyện về trường học sau giờ học.',
     1.0, 'Friends & Relationships', 'A1', 'Speaking Part 1 (Friends).',
     array['Speaking', 'Listening'],
     array['talk to', 'talk about', 'talk with'],
     array['speak', 'chat'],
     array['listen'],
     array['talkative', 'talk'],
     'Talk to someone về nội dung, talk about something về chủ đề.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'chat', 'trò chuyện', 'to talk in a friendly and relaxed way', 'verb', '/tʃæt/',
     'I often chat with my friends online.', 'Tôi thường trò chuyện với bạn bè trên mạng.',
     1.0, 'Friends & Relationships', 'A1', 'Speaking Part 1 (Friends).',
     array['Speaking', 'Listening'],
     array['chat with', 'chat online', 'have a chat'],
     array['talk', 'gossip'],
     array[]::text[],
     array['chatty', 'chatroom'],
     'Chat mang sắc thái thân mật hơn talk.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'play', 'chơi', 'to do something for fun', 'verb', '/pleɪ/',
     'We play games together after school.', 'Chúng tôi chơi trò chơi cùng nhau sau giờ học.',
     1.0, 'Friends & Relationships', 'A1', 'Speaking Part 1 (Friends).',
     array['Speaking', 'Listening'],
     array['play games', 'play together', 'play with friends'],
     array['enjoy'],
     array['work'],
     array['player', 'playful', 'playground'],
     'Play + game/sport, không dùng do.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'share', 'chia sẻ', 'to let another person use or have part of something', 'verb', '/ʃer/',
     'I share my lunch with my friend.', 'Tôi chia sẻ bữa trưa với bạn.',
     1.0, 'Friends & Relationships', 'A1', 'Speaking Part 1 (Friends).',
     array['Speaking', 'Listening', 'Writing'],
     array['share with', 'share ideas', 'share a room'],
     array['split'],
     array['keep'],
     array['shared', 'sharing'],
     'Share cũng là danh từ: a share of.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'smile', 'mỉm cười', 'to make a happy face without sound', 'verb', '/smaɪl/',
     'My friend always smiles at me.', 'Bạn tôi luôn mỉm cười với tôi.',
     1.0, 'Friends & Relationships', 'A1', 'Speaking Part 1 (Feelings).',
     array['Speaking', 'Listening'],
     array['smile at', 'big smile', 'warm smile'],
     array['grin'],
     array['frown'],
     array['smiling', 'smiley'],
     'Smile at someone, không dùng smile to.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'laugh', 'cười', 'to make sounds that show you are happy', 'verb', '/læf/',
     'We laugh a lot when we are together.', 'Chúng tôi cười rất nhiều khi ở bên nhau.',
     1.0, 'Friends & Relationships', 'A1', 'Speaking Part 1 (Feelings).',
     array['Speaking', 'Listening'],
     array['laugh at', 'laugh out loud', 'make someone laugh'],
     array['giggle'],
     array['cry'],
     array['laughter', 'laughing'],
     'Laugh at có thể mang nghĩa chế giễu, cần cẩn thận.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'party', 'bữa tiệc', 'an event where people enjoy food and fun', 'noun', '/ˈpɑːrti/',
     'I go to my friend''s party on Saturday.', 'Tôi đến bữa tiệc của bạn vào thứ Bảy.',
     1.0, 'Friends & Relationships', 'A1', 'Speaking Part 1 (Events).',
     array['Speaking', 'Listening'],
     array['birthday party', 'have a party', 'go to a party'],
     array['celebration'],
     array[]::text[],
     array['partygoer'],
     'Party còn có nghĩa là đảng phái trong chính trị.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'invite', 'mời', 'to ask someone to come to an event', 'verb', '/ɪnˈvaɪt/',
     'I invite my friends to my house.', 'Tôi mời bạn đến nhà tôi.',
     1.0, 'Friends & Relationships', 'A1', 'Speaking Part 1 (Events).',
     array['Speaking', 'Listening'],
     array['invite friends', 'invite to a party', 'kindly invite'],
     array['ask'],
     array[]::text[],
     array['invitation', 'invitee'],
     'Invite someone to + danh từ.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'welcome', 'chào đón', 'to greet someone in a friendly way', 'verb', '/ˈwelkəm/',
     'They welcome new students warmly.', 'Họ chào đón học sinh mới một cách nồng nhiệt.',
     1.0, 'Friends & Relationships', 'A1', 'Listening Section 1 (Greetings).',
     array['Speaking', 'Listening'],
     array['welcome guests', 'warm welcome', 'welcome to'],
     array['greet'],
     array['reject'],
     array['welcoming', 'welcome'],
     'You are welcome là câu đáp lại lời cảm ơn.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'thank', 'cảm ơn', 'to tell someone you are grateful', 'verb', '/θæŋk/',
     'I thank my friend for her help.', 'Tôi cảm ơn bạn vì đã giúp tôi.',
     1.0, 'Friends & Relationships', 'A1', 'Speaking Part 1 (Politeness).',
     array['Speaking', 'Listening'],
     array['thank you', 'thank someone for', 'thanks a lot'],
     array[]::text[],
     array[]::text[],
     array['thanks', 'thankful'],
     'Thank someone for + danh từ hoặc V-ing.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'sorry', 'xin lỗi', 'feeling sad about something you did', 'adjective', '/ˈsɑːri/',
     'I am sorry for being late.', 'Tôi xin lỗi vì đến muộn.',
     1.0, 'Friends & Relationships', 'A1', 'Listening Section 1 (Conversation).',
     array['Speaking', 'Listening'],
     array['say sorry', 'feel sorry', 'sorry for'],
     array['apologetic'],
     array[]::text[],
     array['sorrow', 'sorrowful'],
     'Sorry to hear that dùng để chia sẻ tin buồn.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'please', 'làm ơn', 'a polite word used to ask for something', 'adverb', '/pliːz/',
     'Please sit next to me.', 'Làm ơn ngồi cạnh tôi.',
     1.0, 'Friends & Relationships', 'A1', 'Listening Section 1 (Requests).',
     array['Speaking', 'Listening'],
     array['yes please', 'please help', 'please wait'],
     array['kindly'],
     array[]::text[],
     array['pleased', 'pleasure', 'pleasant'],
     'Please đứng đầu hoặc cuối câu để lịch sự hơn.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'polite', 'lịch sự', 'having good manners', 'adjective', '/pəˈlaɪt/',
     'My friend is always polite to teachers.', 'Bạn tôi luôn lịch sự với giáo viên.',
     1.0, 'Friends & Relationships', 'A1', 'Speaking Part 1 (People).',
     array['Speaking', 'Writing'],
     array['polite to', 'polite person', 'very polite'],
     array['courteous', 'respectful'],
     array['rude'],
     array['politely', 'politeness', 'impolite'],
     'Polite to someone, không dùng polite with.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'funny', 'hài hước, buồn cười', 'making you laugh', 'adjective', '/ˈfʌni/',
     'My best friend is very funny.', 'Bạn thân của tôi rất hài hước.',
     1.0, 'Friends & Relationships', 'A1', 'Speaking Part 2 (Describe a person).',
     array['Speaking', 'Listening'],
     array['funny person', 'funny story', 'really funny'],
     array['amusing', 'humorous'],
     array['serious'],
     array['fun', 'funnily'],
     'Funny cũng có thể mang nghĩa lạ lùng.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'nice', 'tốt, dễ mến', 'pleasant and friendly', 'adjective', '/naɪs/',
     'She is a nice person.', 'Cô ấy là một người dễ mến.',
     1.0, 'Friends & Relationships', 'A1', 'Speaking Part 1 (People).',
     array['Speaking', 'Listening'],
     array['nice person', 'nice to meet you', 'nice weather'],
     array['pleasant', 'kind'],
     array['unpleasant'],
     array['nicely', 'niceness'],
     'Nice thường dùng trong nói, ở Writing nên dùng từ cụ thể hơn.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'shy', 'nhút nhát', 'not confident with other people', 'adjective', '/ʃaɪ/',
     'I was shy when I met new classmates.', 'Tôi nhút nhát khi gặp các bạn cùng lớp mới.',
     1.0, 'Friends & Relationships', 'A1', 'Speaking Part 2 (Describe a person).',
     array['Speaking', 'Listening'],
     array['shy person', 'feel shy', 'shy at first'],
     array['timid', 'reserved'],
     array['confident', 'outgoing'],
     array['shyly', 'shyness'],
     'Shy about doing something là ngại làm gì.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'lonely', 'cô đơn', 'sad because you have no friends near you', 'adjective', '/ˈloʊnli/',
     'He feels lonely in a new city.', 'Anh ấy cảm thấy cô đơn ở thành phố mới.',
     1.0, 'Friends & Relationships', 'A1', 'Speaking Part 1 (Feelings).',
     array['Speaking', 'Listening', 'Writing'],
     array['feel lonely', 'lonely person', 'lonely life'],
     array['isolated'],
     array['sociable'],
     array['loneliness', 'alone'],
     'Lonely nói về cảm giác, alone chỉ trạng thái ở một mình.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'happy', 'vui vẻ', 'feeling pleasure or joy', 'adjective', '/ˈhæpi/',
     'I am happy when I meet my friends.', 'Tôi vui khi gặp bạn bè.',
     1.0, 'Friends & Relationships', 'A1', 'Speaking Part 1 (Feelings).',
     array['Speaking', 'Listening', 'Writing'],
     array['feel happy', 'happy with', 'happy to see you'],
     array['glad', 'pleased'],
     array['sad', 'unhappy'],
     array['happiness', 'happily', 'unhappy'],
     'Happy with nói về sự hài lòng.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'sad', 'buồn', 'feeling unhappy', 'adjective', '/sæd/',
     'I feel sad when my friend moves away.', 'Tôi buồn khi bạn tôi chuyển đi.',
     1.0, 'Friends & Relationships', 'A1', 'Speaking Part 1 (Feelings).',
     array['Speaking', 'Listening'],
     array['feel sad', 'sad news', 'sad story'],
     array['unhappy', 'upset'],
     array['happy'],
     array['sadness', 'sadly', 'sadden'],
     'Sad about something hoặc sad to hear.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'like', 'thích', 'to enjoy or find someone or something nice', 'verb', '/laɪk/',
     'I like my friends very much.', 'Tôi rất quý bạn bè của mình.',
     1.0, 'Friends & Relationships', 'A1', 'Speaking Part 1 (Preferences).',
     array['Speaking', 'Listening'],
     array['like doing', 'like to', 'would like'],
     array['enjoy', 'be fond of'],
     array['dislike', 'hate'],
     array['likely', 'likeable', 'unlike'],
     'Like + V-ing hoặc to V đều được, nghĩa gần giống.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'miss', 'nhớ', 'to feel sad because someone is not with you', 'verb', '/mɪs/',
     'I miss my friends from primary school.', 'Tôi nhớ các bạn hồi tiểu học.',
     1.0, 'Friends & Relationships', 'A1', 'Speaking Part 1 (Feelings).',
     array['Speaking', 'Listening'],
     array['miss my friends', 'miss someone a lot', 'miss the bus'],
     array['long for'],
     array[]::text[],
     array['missing', 'missed'],
     'Miss còn có nghĩa là lỡ (miss a bus).')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'call', 'gọi điện', 'to phone someone', 'verb', '/kɔːl/',
     'I call my best friend every night.', 'Tôi gọi điện cho bạn thân mỗi tối.',
     1.0, 'Friends & Relationships', 'A1', 'Speaking Part 1 (Communication).',
     array['Speaking', 'Listening'],
     array['call a friend', 'phone call', 'call back'],
     array['phone', 'ring'],
     array[]::text[],
     array['caller', 'calling'],
     'Call someone, không cần thêm to.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'message', 'tin nhắn', 'a written or spoken piece of information sent to someone', 'noun', '/ˈmesɪdʒ/',
     'My friend sends me a message every day.', 'Bạn tôi gửi cho tôi một tin nhắn mỗi ngày.',
     1.0, 'Friends & Relationships', 'A1', 'Speaking Part 1 (Technology).',
     array['Speaking', 'Listening', 'Writing'],
     array['send a message', 'text message', 'leave a message'],
     array['note', 'text'],
     array[]::text[],
     array['messenger', 'messaging'],
     'Có thể là động từ trong hội thoại: message me.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'stranger', 'người lạ', 'a person you do not know', 'noun', '/ˈstreɪndʒər/',
     'I do not talk to strangers online.', 'Tôi không nói chuyện với người lạ trên mạng.',
     1.0, 'Friends & Relationships', 'A1', 'Speaking Part 3 (Safety).',
     array['Speaking', 'Listening', 'Writing'],
     array['talk to a stranger', 'complete stranger', 'meet a stranger'],
     array['outsider'],
     array['friend', 'acquaintance'],
     array['strange', 'strangely'],
     'Strange (lạ) và stranger (người lạ) cùng gốc từ.')
  on conflict do nothing;

end $$;
