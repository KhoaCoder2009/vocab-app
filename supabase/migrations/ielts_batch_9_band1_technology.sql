-- BATCH 9 | BAND 1.0 | TOPIC: Technology | PART: Core Vocabulary | NUMBER OF WORDS: 30 | CEFR: A1
-- Gợi ý: nên có unique index (set_id, word) để "on conflict do nothing" chống trùng khi chạy lại:
-- create unique index if not exists vocabularies_set_word_uidx on public.vocabularies (set_id, lower(word));

do $$
declare
  v_set_id uuid;
begin
  select id into v_set_id
  from public.vocabulary_sets
  where title = 'IELTS Band 1: Technology' and owner_id is null
  limit 1;

  if v_set_id is null then
    insert into public.vocabulary_sets
      (owner_id, title, description, difficulty, is_public, cover_color)
    values
      (null, 'IELTS Band 1: Technology',
       'Từ vựng IELTS chủ đề Technology cho Band 1: thiết bị, máy móc và cách dùng công nghệ cơ bản.',
       'easy', true, 'blue')
    on conflict do nothing
    returning id into v_set_id;
  end if;

  if v_set_id is null then
    select id into v_set_id from public.vocabulary_sets where title = 'IELTS Band 1: Technology' limit 1;
  end if;


  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'technology', 'công nghệ', 'machines and methods made by science', 'noun', '/tekˈnɑːlədʒi/',
     'Technology makes our life easier.', 'Công nghệ làm cuộc sống của chúng ta dễ dàng hơn.',
     1.0, 'Technology', 'A1', 'Speaking Part 1 and Writing Task 2 (Technology).',
     array['Speaking', 'Listening', 'Writing'],
     array['modern technology', 'new technology', 'use technology'],
     array[]::text[],
     array[]::text[],
     array['technological', 'technologically', 'technician'],
     'Là danh từ không đếm được khi nói chung.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'computer', 'máy tính', 'a machine that stores and works with information', 'noun', '/kəmˈpjuːtər/',
     'I use a computer at school.', 'Tôi dùng máy tính ở trường.',
     1.0, 'Technology', 'A1', 'Speaking Part 1 (Technology).',
     array['Speaking', 'Listening', 'Writing'],
     array['use a computer', 'computer game', 'computer screen'],
     array['PC'],
     array[]::text[],
     array['compute', 'computing', 'computerise'],
     'Computer game là trò chơi trên máy tính.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'laptop', 'máy tính xách tay', 'a small computer that you can carry', 'noun', '/ˈlæptɑːp/',
     'My brother has a new laptop.', 'Anh trai tôi có một chiếc máy tính xách tay mới.',
     1.0, 'Technology', 'A1', 'Speaking Part 1 (Technology).',
     array['Speaking', 'Listening'],
     array['open a laptop', 'laptop bag', 'buy a laptop'],
     array['notebook'],
     array[]::text[],
     array['lap', 'top'],
     'Laptop được dùng nhiều hơn notebook.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'smartphone', 'điện thoại thông minh', 'a mobile phone that can use the internet', 'noun', '/ˈsmɑːrtfoʊn/',
     'I use my smartphone every day.', 'Tôi dùng điện thoại thông minh mỗi ngày.',
     1.0, 'Technology', 'A1', 'Speaking Part 1 (Technology).',
     array['Speaking', 'Listening', 'Writing'],
     array['use a smartphone', 'smartphone app', 'new smartphone'],
     array['mobile phone'],
     array[]::text[],
     array['smart', 'phone'],
     'Anh-Anh hay gọi là mobile, Anh-Mỹ hay gọi là cell phone.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'tablet', 'máy tính bảng', 'a flat computer with a touch screen', 'noun', '/ˈtæblət/',
     'My sister reads books on a tablet.', 'Em gái tôi đọc sách trên máy tính bảng.',
     1.0, 'Technology', 'A1', 'Speaking Part 1 (Technology).',
     array['Speaking', 'Listening'],
     array['use a tablet', 'tablet screen', 'buy a tablet'],
     array['iPad'],
     array[]::text[],
     array['tablets'],
     'Tablet còn là viên thuốc.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'screen', 'màn hình', 'the flat part of a computer or phone that shows pictures', 'noun', '/skriːn/',
     'The screen is too bright.', 'Màn hình quá sáng.',
     1.0, 'Technology', 'A1', 'Speaking Part 1 (Technology).',
     array['Speaking', 'Listening', 'Writing'],
     array['phone screen', 'computer screen', 'touch screen'],
     array['display'],
     array[]::text[],
     array['screenshot', 'widescreen'],
     'Screen time là thời gian nhìn màn hình.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'keyboard', 'bàn phím', 'a set of keys used to type', 'noun', '/ˈkiːbɔːrd/',
     'I type on the keyboard very fast.', 'Tôi gõ rất nhanh trên bàn phím.',
     1.0, 'Technology', 'A1', 'Speaking Part 1 (Technology).',
     array['Speaking', 'Listening'],
     array['use a keyboard', 'computer keyboard', 'keyboard shortcut'],
     array[]::text[],
     array[]::text[],
     array['key', 'board'],
     'Keyboard cũng là đàn phím điện tử.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'mouse', 'chuột máy tính', 'a small tool you move to control a computer', 'noun', '/maʊs/',
     'I click the mouse to open the file.', 'Tôi nhấp chuột để mở tập tin.',
     1.0, 'Technology', 'A1', 'Speaking Part 1 (Technology).',
     array['Speaking', 'Listening'],
     array['click the mouse', 'computer mouse', 'wireless mouse'],
     array[]::text[],
     array[]::text[],
     array['mice'],
     'Số nhiều là mice, và mouse cũng là con chuột.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'button', 'nút bấm', 'a small part you press to make a machine work', 'noun', '/ˈbʌtn/',
     'Press this button to start.', 'Nhấn nút này để bắt đầu.',
     1.0, 'Technology', 'A1', 'Listening Section 1 (Instructions).',
     array['Speaking', 'Listening', 'Reading'],
     array['press a button', 'push a button', 'start button'],
     array['switch'],
     array[]::text[],
     array['buttons'],
     'Button còn là cúc áo.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'battery', 'pin', 'a small object that gives power to a device', 'noun', '/ˈbætəri/',
     'My phone battery is very low.', 'Pin điện thoại của tôi rất yếu.',
     1.0, 'Technology', 'A1', 'Speaking Part 1 (Technology).',
     array['Speaking', 'Listening'],
     array['low battery', 'battery life', 'phone battery'],
     array[]::text[],
     array[]::text[],
     array['batteries'],
     'Battery life là thời lượng pin.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'charger', 'bộ sạc', 'a device that gives power to a battery', 'noun', '/ˈtʃɑːrdʒər/',
     'Can I borrow your phone charger?', 'Tôi mượn bộ sạc điện thoại của bạn được không?',
     1.0, 'Technology', 'A1', 'Speaking Part 1 (Technology).',
     array['Speaking', 'Listening'],
     array['phone charger', 'laptop charger', 'borrow a charger'],
     array[]::text[],
     array[]::text[],
     array['charge', 'rechargeable'],
     'Charger là danh từ từ động từ charge.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'machine', 'máy móc', 'a piece of equipment that does a job', 'noun', '/məˈʃiːn/',
     'This machine washes clothes.', 'Chiếc máy này giặt quần áo.',
     1.0, 'Technology', 'A1', 'Speaking Part 1 (Technology).',
     array['Speaking', 'Listening', 'Writing'],
     array['washing machine', 'coffee machine', 'machine learning'],
     array['device', 'equipment'],
     array[]::text[],
     array['machinery', 'mechanic', 'mechanical'],
     'Machine phát âm /məˈʃiːn/, chữ ch đọc là /ʃ/.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'robot', 'người máy', 'a machine that can do work like a person', 'noun', '/ˈroʊbɑːt/',
     'A robot cleans our floor every day.', 'Một chú robot lau sàn nhà chúng tôi mỗi ngày.',
     1.0, 'Technology', 'A1', 'Speaking Part 1 and Part 3 (Technology).',
     array['Speaking', 'Listening', 'Writing'],
     array['robot arm', 'cleaning robot', 'robot teacher'],
     array['automaton'],
     array[]::text[],
     array['robotic', 'robotics'],
     'Robotics là ngành chế tạo robot.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'radio', 'đài phát thanh', 'a machine that plays sounds sent through the air', 'noun', '/ˈreɪdioʊ/',
     'My grandfather listens to the radio.', 'Ông tôi nghe đài phát thanh.',
     1.0, 'Technology', 'A1', 'Speaking Part 1 (Technology).',
     array['Speaking', 'Listening'],
     array['listen to the radio', 'radio station', 'radio programme'],
     array[]::text[],
     array[]::text[],
     array['radios'],
     'Dùng listen to the radio, không dùng watch the radio.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'printer', 'máy in', 'a machine that puts words or pictures on paper', 'noun', '/ˈprɪntər/',
     'The printer is in the school library.', 'Máy in nằm trong thư viện trường.',
     1.0, 'Technology', 'A1', 'Listening Section 1 (Office).',
     array['Speaking', 'Listening'],
     array['use a printer', 'colour printer', 'printer paper'],
     array[]::text[],
     array[]::text[],
     array['print', 'printing'],
     'Printer là danh từ chỉ thiết bị.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'click', 'nhấp chuột', 'to press a button on a mouse', 'verb', '/klɪk/',
     'Click here to open the file.', 'Nhấp vào đây để mở tập tin.',
     1.0, 'Technology', 'A1', 'Listening Section 1 (Instructions).',
     array['Speaking', 'Listening', 'Reading'],
     array['click on', 'click here', 'double click'],
     array['press'],
     array[]::text[],
     array['clicking'],
     'Click on + danh từ.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'type', 'gõ', 'to write using a keyboard', 'verb', '/taɪp/',
     'I type my homework on the computer.', 'Tôi gõ bài tập trên máy tính.',
     1.0, 'Technology', 'A1', 'Speaking Part 1 (Technology).',
     array['Speaking', 'Listening'],
     array['type a message', 'type quickly', 'type your name'],
     array['key in'],
     array[]::text[],
     array['typing', 'typist', 'typical'],
     'Type còn là danh từ: what type of.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'print', 'in', 'to put words or pictures on paper with a machine', 'verb', '/prɪnt/',
     'Please print this page for me.', 'Làm ơn in trang này cho tôi.',
     1.0, 'Technology', 'A1', 'Listening Section 1 (Office).',
     array['Speaking', 'Listening'],
     array['print a page', 'print a photo', 'print out'],
     array[]::text[],
     array[]::text[],
     array['printer', 'printing', 'printout'],
     'Print out là cụm phrasal verb quen thuộc.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'charge', 'sạc', 'to put power into a battery', 'verb', '/tʃɑːrdʒ/',
     'I charge my phone every night.', 'Tôi sạc điện thoại mỗi đêm.',
     1.0, 'Technology', 'A1', 'Speaking Part 1 (Technology).',
     array['Speaking', 'Listening'],
     array['charge a phone', 'fully charged', 'charge the battery'],
     array['recharge'],
     array['drain'],
     array['charger', 'rechargeable'],
     'Charge còn là tiền phải trả: free of charge.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'switch', 'bật, tắt', 'to change from one thing to another', 'verb', '/swɪtʃ/',
     'Please switch off the light.', 'Làm ơn tắt đèn.',
     1.0, 'Technology', 'A1', 'Listening Section 1 (Instructions).',
     array['Speaking', 'Listening', 'Writing'],
     array['switch on', 'switch off', 'light switch'],
     array['turn'],
     array[]::text[],
     array['switchboard'],
     'Switch on/off dùng cho thiết bị.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'use', 'sử dụng', 'to do something with a thing for a purpose', 'verb', '/juːz/',
     'I use my phone to learn English.', 'Tôi dùng điện thoại để học tiếng Anh.',
     1.0, 'Technology', 'A1', 'Speaking Part 1 (Technology).',
     array['Speaking', 'Listening', 'Writing'],
     array['use a computer', 'use for', 'used to'],
     array['apply', 'employ'],
     array['misuse'],
     array['user', 'usage', 'useful'],
     'Use là động từ /juːz/, danh từ use /juːs/.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'useful', 'hữu ích', 'helping you do or get something', 'adjective', '/ˈjuːsfl/',
     'This app is very useful for students.', 'Ứng dụng này rất hữu ích cho học sinh.',
     1.0, 'Technology', 'A1', 'Speaking Part 1 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['very useful', 'useful tool', 'useful for'],
     array['helpful', 'handy'],
     array['useless'],
     array['use', 'usefully', 'usefulness'],
     'Useful for + danh từ hoặc V-ing.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'modern', 'hiện đại', 'new and using the latest ideas or machines', 'adjective', '/ˈmɑːdərn/',
     'Modern phones are small and fast.', 'Điện thoại hiện đại nhỏ và nhanh.',
     1.0, 'Technology', 'A1', 'Speaking Part 1 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['modern life', 'modern technology', 'modern building'],
     array['up-to-date', 'contemporary'],
     array['old-fashioned', 'traditional'],
     array['modernise', 'modernisation'],
     'Modern life là cụm hay dùng khi nói về xã hội.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'easy', 'dễ', 'not difficult', 'adjective', '/ˈiːzi/',
     'This machine is easy to use.', 'Chiếc máy này dễ dùng.',
     1.0, 'Technology', 'A1', 'Speaking Part 1 (Technology).',
     array['Speaking', 'Listening', 'Writing'],
     array['easy to use', 'easy to learn', 'easy task'],
     array['simple', 'effortless'],
     array['difficult', 'hard'],
     array['ease', 'easily', 'easier'],
     'Easy to + động từ nguyên mẫu.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'invent', 'phát minh', 'to make something new for the first time', 'verb', '/ɪnˈvent/',
     'Someone invented the phone many years ago.', 'Ai đó đã phát minh ra điện thoại từ nhiều năm trước.',
     1.0, 'Technology', 'A1', 'Speaking Part 3 (Technology).',
     array['Speaking', 'Listening', 'Reading'],
     array['invent a machine', 'invent something new', 'invent a game'],
     array['create', 'design'],
     array[]::text[],
     array['invention', 'inventor', 'inventive'],
     'Invent là tạo ra cái mới, discover là tìm ra cái sẵn có.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'tool', 'công cụ', 'something you use to do a job', 'noun', '/tuːl/',
     'A phone is a useful learning tool.', 'Điện thoại là một công cụ học tập hữu ích.',
     1.0, 'Technology', 'A1', 'Speaking Part 1 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['useful tool', 'learning tool', 'online tool'],
     array['instrument', 'device'],
     array[]::text[],
     array['toolbar', 'toolkit'],
     'Learning tool là cụm rất hay dùng khi nói về công nghệ.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'plug', 'phích cắm, cắm vào', 'a piece that connects a machine to electricity', 'noun', '/plʌɡ/',
     'Put the plug in the wall.', 'Cắm phích vào tường.',
     1.0, 'Technology', 'A1', 'Listening Section 1 (Instructions).',
     array['Speaking', 'Listening'],
     array['plug in', 'unplug', 'plug socket'],
     array[]::text[],
     array[]::text[],
     array['unplug', 'plugin'],
     'Plug in là cắm vào, unplug là rút ra.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'speaker', 'loa', 'a machine that plays sound', 'noun', '/ˈspiːkər/',
     'The speaker is too loud.', 'Chiếc loa to quá.',
     1.0, 'Technology', 'A1', 'Speaking Part 1 (Technology).',
     array['Speaking', 'Listening'],
     array['loud speaker', 'wireless speaker', 'speaker system'],
     array[]::text[],
     array[]::text[],
     array['speak', 'speech'],
     'Speaker còn là người nói.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'headphones', 'tai nghe', 'a device you wear on your ears to listen', 'noun', '/ˈhedfoʊnz/',
     'I wear headphones on the bus.', 'Tôi đeo tai nghe khi đi xe buýt.',
     1.0, 'Technology', 'A1', 'Speaking Part 1 (Music).',
     array['Speaking', 'Listening'],
     array['wear headphones', 'wireless headphones', 'noise-cancelling headphones'],
     array['earphones'],
     array[]::text[],
     array['head', 'phone'],
     'Luôn ở dạng số nhiều: a pair of headphones.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'device', 'thiết bị', 'a small machine that does a special job', 'noun', '/dɪˈvaɪs/',
     'A phone is a useful device.', 'Điện thoại là một thiết bị hữu ích.',
     1.0, 'Technology', 'A1', 'Speaking Part 1 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['electronic device', 'mobile device', 'smart device'],
     array['gadget', 'machine'],
     array[]::text[],
     array['devise'],
     'Device là danh từ /dɪˈvaɪs/, devise là động từ /dɪˈvaɪz/.')
  on conflict do nothing;

end $$;
