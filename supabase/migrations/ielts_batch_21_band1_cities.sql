-- BATCH 21 | BAND 1.0 | TOPIC: Cities | PART: Core Vocabulary | NUMBER OF WORDS: 30 | CEFR: A1
-- Gợi ý: nên có unique index (set_id, word) để "on conflict do nothing" chống trùng khi chạy lại:
-- create unique index if not exists vocabularies_set_word_uidx on public.vocabularies (set_id, lower(word));

do $$
declare
  v_set_id uuid;
begin
  select id into v_set_id
  from public.vocabulary_sets
  where title = 'IELTS Band 1: Cities' and owner_id is null
  limit 1;

  if v_set_id is null then
    insert into public.vocabulary_sets
      (owner_id, title, description, difficulty, is_public, cover_color)
    values
      (null, 'IELTS Band 1: Cities',
       'Từ vựng IELTS chủ đề Cities cho Band 1: thành phố, toà nhà, khu phố và cuộc sống đô thị cơ bản.',
       'easy', true, 'blue')
    on conflict do nothing
    returning id into v_set_id;
  end if;

  if v_set_id is null then
    select id into v_set_id from public.vocabulary_sets where title = 'IELTS Band 1: Cities' limit 1;
  end if;


  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'city', 'thành phố', 'a large and important town', 'noun', '/ˈsɪti/',
     'I live in a big city.', 'Tôi sống ở một thành phố lớn.',
     1.0, 'Cities', 'A1', 'Speaking Part 1 and Part 2 (Places).',
     array['Speaking', 'Listening', 'Writing'],
     array['big city', 'city centre', 'capital city'],
     array['metropolis'],
     array['village'],
     array['cities', 'citizen', 'civic'],
     'City centre là trung tâm thành phố.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'town', 'thị trấn', 'a place with many houses and shops, smaller than a city', 'noun', '/taʊn/',
     'My town is small and quiet.', 'Thị trấn của tôi nhỏ và yên tĩnh.',
     1.0, 'Cities', 'A1', 'Speaking Part 1 (Places).',
     array['Speaking', 'Listening', 'Writing'],
     array['small town', 'town centre', 'old town'],
     array['township'],
     array['city'],
     array['townspeople', 'downtown'],
     'Old town là khu phố cổ.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'building', 'toà nhà', 'a structure with walls and a roof', 'noun', '/ˈbɪldɪŋ/',
     'There are many tall buildings in the city.', 'Có nhiều toà nhà cao trong thành phố.',
     1.0, 'Cities', 'A1', 'Speaking Part 1 and Part 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['tall building', 'old building', 'office building'],
     array['structure'],
     array[]::text[],
     array['build', 'builder'],
     'Building là danh từ, build là động từ.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'tower', 'toà tháp', 'a tall narrow building', 'noun', '/ˈtaʊər/',
     'The tower is the tallest in the city.', 'Toà tháp cao nhất thành phố.',
     1.0, 'Cities', 'A1', 'Speaking Part 2 (Places).',
     array['Speaking', 'Listening'],
     array['tall tower', 'clock tower', 'water tower'],
     array[]::text[],
     array[]::text[],
     array['towers'],
     'Clock tower là tháp đồng hồ.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'skyscraper', 'nhà chọc trời', 'a very tall building in a city', 'noun', '/ˈskaɪskreɪpər/',
     'The city has many skyscrapers.', 'Thành phố có nhiều nhà chọc trời.',
     1.0, 'Cities', 'A1', 'Speaking Part 1 and Writing Task 1.',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['tall skyscraper', 'build a skyscraper', 'skyscraper in the city'],
     array['high-rise'],
     array[]::text[],
     array['sky', 'scraper'],
     'Skyscraper = sky + scrape.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'shop', 'cửa hàng', 'a place where people buy things', 'noun', '/ʃɑːp/',
     'There is a small shop near my house.', 'Có một cửa hàng nhỏ gần nhà tôi.',
     1.0, 'Cities', 'A1', 'Speaking Part 1 (Places).',
     array['Speaking', 'Listening', 'Writing'],
     array['small shop', 'shop window', 'go to the shop'],
     array['store'],
     array[]::text[],
     array['shopper', 'shopping'],
     'Cũng là động từ: shop for clothes.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'skyline', 'đường chân trời thành phố', 'the shape of buildings against the sky', 'noun', '/ˈskaɪlaɪn/',
     'The city skyline is beautiful at night.', 'Đường chân trời của thành phố rất đẹp vào ban đêm.',
     1.0, 'Cities', 'A1', 'Speaking Part 2 (Places).',
     array['Speaking', 'Listening', 'Writing'],
     array['city skyline', 'beautiful skyline', 'skyline view'],
     array[]::text[],
     array[]::text[],
     array['sky', 'line'],
     'Skyline là hình dáng các toà nhà trên nền trời.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'bank', 'ngân hàng', 'a place where people keep money', 'noun', '/bæŋk/',
     'The bank is next to the post office.', 'Ngân hàng nằm cạnh bưu điện.',
     1.0, 'Cities', 'A1', 'Speaking Part 1 and Listening.',
     array['Speaking', 'Listening'],
     array['go to the bank', 'bank account', 'bank card'],
     array[]::text[],
     array[]::text[],
     array['banker', 'banking'],
     'Bank còn là bờ sông: river bank.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'cinema', 'rạp chiếu phim', 'a place where people watch films', 'noun', '/ˈsɪnəmə/',
     'We go to the cinema on Saturday.', 'Chúng tôi đi rạp chiếu phim vào thứ Bảy.',
     1.0, 'Cities', 'A1', 'Speaking Part 1 (Free Time).',
     array['Speaking', 'Listening'],
     array['go to the cinema', 'cinema ticket', 'local cinema'],
     array['movie theatre'],
     array[]::text[],
     array['cinematic'],
     'Anh-Mỹ nói movie theater.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'theatre', 'nhà hát', 'a building where plays are shown', 'noun', '/ˈθiːətər/',
     'The theatre is in the city centre.', 'Nhà hát nằm ở trung tâm thành phố.',
     1.0, 'Cities', 'A1', 'Speaking Part 1 and Part 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['go to the theatre', 'local theatre', 'theatre show'],
     array['playhouse'],
     array[]::text[],
     array['theatrical'],
     'Anh-Mỹ viết theater.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'square', 'quảng trường', 'an open area in a town with buildings around it', 'noun', '/skwer/',
     'People meet in the square in the evening.', 'Mọi người gặp nhau ở quảng trường vào buổi tối.',
     1.0, 'Cities', 'A1', 'Speaking Part 1 and Part 2.',
     array['Speaking', 'Listening'],
     array['town square', 'main square', 'meet in the square'],
     array['plaza'],
     array[]::text[],
     array['squares'],
     'Square còn là hình vuông.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'centre', 'trung tâm', 'the middle of a place', 'noun', '/ˈsentər/',
     'My school is in the city centre.', 'Trường tôi nằm ở trung tâm thành phố.',
     1.0, 'Cities', 'A1', 'Speaking Part 1 and Part 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['city centre', 'shopping centre', 'in the centre'],
     array['middle'],
     array['edge'],
     array['central', 'centrally'],
     'Anh-Mỹ viết center.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'capital', 'thủ đô', 'the most important city in a country', 'noun', '/ˈkæpɪtl/',
     'Hanoi is the capital of Vietnam.', 'Hà Nội là thủ đô của Việt Nam.',
     1.0, 'Cities', 'A1', 'Speaking Part 1 and Part 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['capital city', 'capital of', 'visit the capital'],
     array[]::text[],
     array[]::text[],
     array['capitalism', 'capitalise'],
     'Capital còn là tiền vốn.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'area', 'khu vực', 'a part of a town or country', 'noun', '/ˈeriə/',
     'I live in a quiet area.', 'Tôi sống ở một khu vực yên tĩnh.',
     1.0, 'Cities', 'A1', 'Speaking Part 1 and Writing Task 1.',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['local area', 'urban area', 'residential area'],
     array['region', 'zone'],
     array[]::text[],
     array['areas'],
     'Residential area là khu dân cư.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'district', 'quận, khu', 'a part of a city', 'noun', '/ˈdɪstrɪkt/',
     'My district has many small shops.', 'Quận của tôi có nhiều cửa hàng nhỏ.',
     1.0, 'Cities', 'A1', 'Speaking Part 1 and Part 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['business district', 'shopping district', 'central district'],
     array['region'],
     array[]::text[],
     array['districts'],
     'District 1 là quận 1 ở TP. Hồ Chí Minh.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'suburb', 'vùng ngoại ô', 'an area near the edge of a city', 'noun', '/ˈsʌbɜːrb/',
     'We live in a suburb of the city.', 'Chúng tôi sống ở vùng ngoại ô của thành phố.',
     1.0, 'Cities', 'A1', 'Speaking Part 1 and Part 3.',
     array['Speaking', 'Listening', 'Writing'],
     array['live in a suburb', 'quiet suburb', 'suburb of'],
     array['outskirts'],
     array['centre'],
     array['suburban', 'suburbs'],
     'Suburbs thường ở số nhiều: in the suburbs.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'address', 'địa chỉ', 'the details of where a person lives', 'noun', '/ˈædres/',
     'Please write your address here.', 'Vui lòng viết địa chỉ của bạn ở đây.',
     1.0, 'Cities', 'A1', 'Listening Section 1 (Form Filling).',
     array['Speaking', 'Listening', 'Reading'],
     array['home address', 'email address', 'write an address'],
     array['location'],
     array[]::text[],
     array['addressee'],
     'Cũng là động từ: address a problem.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'corner', 'góc phố, góc', 'the place where two roads or walls meet', 'noun', '/ˈkɔːrnər/',
     'The cafe is on the corner of the street.', 'Quán cà phê ở góc phố.',
     1.0, 'Cities', 'A1', 'Listening Section 2 (Directions).',
     array['Speaking', 'Listening'],
     array['on the corner', 'street corner', 'around the corner'],
     array['bend'],
     array[]::text[],
     array['cornered'],
     'Around the corner nghĩa là ngay gần đây.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'pavement', 'vỉa hè', 'the path at the side of a road', 'noun', '/ˈpeɪvmənt/',
     'Walk on the pavement, not on the road.', 'Hãy đi trên vỉa hè, đừng đi trên đường.',
     1.0, 'Cities', 'A1', 'Listening Section 2 (Directions).',
     array['Speaking', 'Listening'],
     array['walk on the pavement', 'busy pavement', 'wide pavement'],
     array['sidewalk'],
     array[]::text[],
     array['pave', 'paving'],
     'Anh-Mỹ dùng sidewalk.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'fountain', 'đài phun nước', 'a structure that sends water into the air', 'noun', '/ˈfaʊntn/',
     'Children play near the fountain.', 'Bọn trẻ chơi gần đài phun nước.',
     1.0, 'Cities', 'A1', 'Speaking Part 2 (Places).',
     array['Speaking', 'Listening'],
     array['water fountain', 'drinking fountain', 'in front of the fountain'],
     array[]::text[],
     array[]::text[],
     array['fountains'],
     'Drinking fountain là vòi nước uống công cộng.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'cafe', 'quán cà phê', 'a small place where you can drink coffee', 'noun', '/kæˈfeɪ/',
     'I meet my friends at a cafe.', 'Tôi gặp bạn bè ở một quán cà phê.',
     1.0, 'Cities', 'A1', 'Speaking Part 1 (Places).',
     array['Speaking', 'Listening'],
     array['go to a cafe', 'coffee cafe', 'small cafe'],
     array['coffee shop'],
     array[]::text[],
     array['cafeteria'],
     'Cafe cũng có thể viết là café.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'police', 'cảnh sát', 'the people who keep order and catch criminals', 'noun', '/pəˈliːs/',
     'Call the police if you need help.', 'Hãy gọi cảnh sát nếu bạn cần giúp đỡ.',
     1.0, 'Cities', 'A1', 'Speaking Part 1 and Listening.',
     array['Speaking', 'Listening'],
     array['call the police', 'police station', 'police officer'],
     array[]::text[],
     array[]::text[],
     array['policeman', 'policewoman'],
     'Police luôn đi với động từ số nhiều.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'lively', 'sôi động', 'full of energy and activity', 'adjective', '/ˈlaɪvli/',
     'The city is lively at night.', 'Thành phố sôi động vào ban đêm.',
     1.0, 'Cities', 'A1', 'Speaking Part 1 and Part 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['lively city', 'lively street', 'lively atmosphere'],
     array['energetic', 'vibrant'],
     array['dull', 'quiet'],
     array['live', 'liveliness'],
     'Lively atmosphere là bầu không khí sôi động.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'convenient', 'thuận tiện', 'easy to use or reach', 'adjective', '/kənˈviːniənt/',
     'The bus is convenient for students.', 'Xe buýt thuận tiện cho học sinh.',
     1.0, 'Cities', 'A1', 'Speaking Part 1 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['convenient location', 'very convenient', 'convenient for'],
     array['handy'],
     array['inconvenient'],
     array['convenience', 'conveniently'],
     'Convenient for + đối tượng.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'noisy', 'ồn ào', 'full of loud sounds', 'adjective', '/ˈnɔɪzi/',
     'The street is noisy at night.', 'Con phố ồn ào vào ban đêm.',
     1.0, 'Cities', 'A1', 'Speaking Part 1 and Part 3.',
     array['Speaking', 'Listening', 'Writing'],
     array['noisy street', 'noisy city', 'too noisy'],
     array['loud'],
     array['quiet', 'peaceful'],
     array['noise', 'noisily'],
     'Noisy nói về nơi chốn, loud nói về âm thanh.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'expensive', 'đắt', 'costing a lot of money', 'adjective', '/ɪkˈspensɪv/',
     'Living in the city is expensive.', 'Sống ở thành phố rất đắt đỏ.',
     1.0, 'Cities', 'A1', 'Speaking Part 1 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['expensive city', 'expensive house', 'very expensive'],
     array['costly'],
     array['cheap'],
     array['expense', 'expensively'],
     'Expensive khác cost một cách đơn thuần.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'cheap', 'rẻ', 'not costing much money', 'adjective', '/tʃiːp/',
     'Street food is cheap and tasty.', 'Đồ ăn đường phố rẻ và ngon.',
     1.0, 'Cities', 'A1', 'Speaking Part 1 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['cheap price', 'cheap food', 'cheap hotel'],
     array['inexpensive', 'low-cost'],
     array['expensive'],
     array['cheaply', 'cheapen'],
     'Cheap có thể mang nghĩa xấu: chất lượng kém.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'facilities', 'cơ sở vật chất, tiện ích', 'buildings and services for a particular purpose', 'noun', '/fəˈsɪlətiz/',
     'The city has good hospital facilities.', 'Thành phố có cơ sở vật chất bệnh viện tốt.',
     1.0, 'Cities', 'A1', 'Speaking Part 3 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['sports facilities', 'modern facilities', 'public facilities'],
     array['amenities'],
     array[]::text[],
     array['facility', 'facilitate'],
     'Thường dùng ở số nhiều: facilities.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'downtown', 'khu trung tâm', 'the main business area of a city', 'noun', '/ˌdaʊnˈtaʊn/',
     'I work downtown near the station.', 'Tôi làm việc ở khu trung tâm gần nhà ga.',
     1.0, 'Cities', 'A1', 'Speaking Part 1 (Places).',
     array['Speaking', 'Listening'],
     array['go downtown', 'downtown area', 'live downtown'],
     array['city centre'],
     array['suburb'],
     array['town'],
     'Dùng nhiều trong Anh-Mỹ.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'neighbourhood', 'khu phố', 'a small area of a town where people live', 'noun', '/ˈneɪbərhʊd/',
     'My neighbourhood is friendly and safe.', 'Khu phố của tôi thân thiện và an toàn.',
     1.0, 'Cities', 'A1', 'Speaking Part 1 and Part 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['quiet neighbourhood', 'safe neighbourhood', 'local neighbourhood'],
     array['community', 'area'],
     array[]::text[],
     array['neighbour'],
     'Anh-Mỹ viết neighborhood.')
  on conflict do nothing;

end $$;
