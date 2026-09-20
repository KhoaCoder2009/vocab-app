-- BATCH 19 | BAND 1.0 | TOPIC: Tourism | PART: Core Vocabulary | NUMBER OF WORDS: 30 | CEFR: A1
-- Gợi ý: nên có unique index (set_id, word) để "on conflict do nothing" chống trùng khi chạy lại:
-- create unique index if not exists vocabularies_set_word_uidx on public.vocabularies (set_id, lower(word));

do $$
declare
  v_set_id uuid;
begin
  select id into v_set_id
  from public.vocabulary_sets
  where title = 'IELTS Band 1: Tourism' and owner_id is null
  limit 1;

  if v_set_id is null then
    insert into public.vocabulary_sets
      (owner_id, title, description, difficulty, is_public, cover_color)
    values
      (null, 'IELTS Band 1: Tourism',
       'Từ vựng IELTS chủ đề Tourism cho Band 1: khách du lịch, điểm tham quan, chỗ ở và lễ hội cơ bản.',
       'easy', true, 'pink')
    on conflict do nothing
    returning id into v_set_id;
  end if;

  if v_set_id is null then
    select id into v_set_id from public.vocabulary_sets where title = 'IELTS Band 1: Tourism' limit 1;
  end if;


  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'tourist', 'khách du lịch', 'a person who travels for fun', 'noun', '/ˈtʊrɪst/',
     'Many tourists visit my city in summer.', 'Nhiều khách du lịch đến thành phố tôi vào mùa hè.',
     1.0, 'Tourism', 'A1', 'Speaking Part 1 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['foreign tourist', 'tourist attraction', 'tourist guide'],
     array['visitor', 'traveller'],
     array[]::text[],
     array['tourism', 'touristy'],
     'Tourist attraction là điểm thu hút khách du lịch.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'tour', 'chuyến tham quan', 'a trip to see interesting places', 'noun', '/tʊr/',
     'We take a tour of the old town.', 'Chúng tôi tham quan khu phố cổ.',
     1.0, 'Tourism', 'A1', 'Speaking Part 1 and Listening.',
     array['Speaking', 'Listening', 'Writing'],
     array['take a tour', 'guided tour', 'tour guide'],
     array['excursion'],
     array[]::text[],
     array['tourist', 'tourism'],
     'Guided tour là tour có hướng dẫn viên.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'guide', 'hướng dẫn viên', 'a person who shows visitors around a place', 'noun', '/ɡaɪd/',
     'The guide tells us about the temple.', 'Hướng dẫn viên kể cho chúng tôi về ngôi đền.',
     1.0, 'Tourism', 'A1', 'Listening Section 1 and Part 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['tour guide', 'local guide', 'guide book'],
     array['escort'],
     array[]::text[],
     array['guidance', 'guidebook'],
     'Cũng là động từ: guide visitors.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'sightseeing', 'ngắm cảnh', 'the activity of visiting famous places', 'noun', '/ˈsaɪtsiːɪŋ/',
     'We go sightseeing in the morning.', 'Chúng tôi đi ngắm cảnh vào buổi sáng.',
     1.0, 'Tourism', 'A1', 'Speaking Part 1 and Part 2 (Travel).',
     array['Speaking', 'Listening'],
     array['go sightseeing', 'sightseeing tour', 'sightseeing trip'],
     array[]::text[],
     array[]::text[],
     array['sight', 'sightseer'],
     'Go sightseeing là cụm cố định.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'attraction', 'điểm thu hút', 'a place that people visit for interest or fun', 'noun', '/əˈtrækʃn/',
     'The tower is a famous attraction.', 'Toà tháp là một điểm thu hút nổi tiếng.',
     1.0, 'Tourism', 'A1', 'Speaking Part 2 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['tourist attraction', 'popular attraction', 'main attraction'],
     array['sight'],
     array[]::text[],
     array['attract', 'attractive'],
     'Tourist attraction là collocation quen thuộc.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'museum', 'bảo tàng', 'a building where old or important things are shown', 'noun', '/mjuˈziːəm/',
     'We visit a museum on rainy days.', 'Chúng tôi thăm bảo tàng vào những ngày mưa.',
     1.0, 'Tourism', 'A1', 'Speaking Part 1 and Part 2 (Places).',
     array['Speaking', 'Listening', 'Writing'],
     array['visit a museum', 'history museum', 'art museum'],
     array['gallery'],
     array[]::text[],
     array['museums'],
     'Nhấn âm thứ hai: mu-SEE-um.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'temple', 'ngôi đền, chùa', 'a building where people pray', 'noun', '/ˈtempl/',
     'There is an old temple near the lake.', 'Có một ngôi chùa cổ gần hồ.',
     1.0, 'Tourism', 'A1', 'Speaking Part 2 (Places).',
     array['Speaking', 'Listening', 'Writing'],
     array['old temple', 'visit a temple', 'Buddhist temple'],
     array['shrine'],
     array[]::text[],
     array['temples'],
     'Temple còn là thái dương trên đầu.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'castle', 'lâu đài', 'a large old building with strong walls', 'noun', '/ˈkæsl/',
     'We visit a castle on the hill.', 'Chúng tôi thăm một lâu đài trên đồi.',
     1.0, 'Tourism', 'A1', 'Speaking Part 2 (Places).',
     array['Speaking', 'Listening', 'Reading'],
     array['old castle', 'visit a castle', 'castle wall'],
     array['fortress'],
     array[]::text[],
     array['castles'],
     'Chữ t trong castle là âm câm.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'monument', 'đài tưởng niệm', 'a building or statue that remembers a person or event', 'noun', '/ˈmɑːnjumənt/',
     'The monument is in the city centre.', 'Đài tưởng niệm nằm ở trung tâm thành phố.',
     1.0, 'Tourism', 'A1', 'Speaking Part 2 and Reading.',
     array['Speaking', 'Listening', 'Reading'],
     array['national monument', 'historic monument', 'visit a monument'],
     array['memorial'],
     array[]::text[],
     array['monumental'],
     'National monument là di tích quốc gia.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'statue', 'bức tượng', 'a figure made from stone or metal', 'noun', '/ˈstætʃuː/',
     'There is a big statue in the park.', 'Có một bức tượng lớn trong công viên.',
     1.0, 'Tourism', 'A1', 'Speaking Part 2 (Places).',
     array['Speaking', 'Listening'],
     array['big statue', 'stone statue', 'statue of'],
     array['sculpture'],
     array[]::text[],
     array['statues'],
     'Statue of + tên người hoặc vật.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'resort', 'khu nghỉ dưỡng', 'a place where people go for a holiday', 'noun', '/rɪˈzɔːrt/',
     'We stay at a beach resort.', 'Chúng tôi ở tại một khu nghỉ dưỡng ven biển.',
     1.0, 'Tourism', 'A1', 'Speaking Part 2 and Listening.',
     array['Speaking', 'Listening', 'Writing'],
     array['beach resort', 'ski resort', 'holiday resort'],
     array['retreat'],
     array[]::text[],
     array['resorts'],
     'Resort còn là động từ: resort to.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'entrance', 'lối vào', 'the place where you go into a building', 'noun', '/ˈentrəns/',
     'The entrance is on the left.', 'Lối vào nằm bên trái.',
     1.0, 'Tourism', 'A1', 'Listening Section 1 (Directions).',
     array['Speaking', 'Listening', 'Reading'],
     array['main entrance', 'entrance fee', 'at the entrance'],
     array['entry'],
     array['exit'],
     array['enter', 'entry'],
     'Entrance fee là phí vào cửa.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'visitor', 'khách tham quan', 'a person who visits a place', 'noun', '/ˈvɪzɪtər/',
     'The museum has many visitors every day.', 'Bảo tàng có nhiều khách tham quan mỗi ngày.',
     1.0, 'Tourism', 'A1', 'Speaking Part 1 and Writing Task 1.',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['foreign visitor', 'visitor centre', 'number of visitors'],
     array['tourist', 'guest'],
     array[]::text[],
     array['visit', 'visiting'],
     'Number of visitors là cụm phổ biến trong Writing Task 1.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'local', 'địa phương', 'from or belonging to the area near you', 'adjective', '/ˈloʊkl/',
     'I like to eat local food when I travel.', 'Tôi thích ăn món địa phương khi đi du lịch.',
     1.0, 'Tourism', 'A1', 'Speaking Part 1 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['local people', 'local food', 'local culture'],
     array['regional'],
     array['foreign', 'global'],
     array['locally', 'locate', 'location'],
     'Local food là món ăn địa phương.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'tradition', 'truyền thống', 'a very old custom', 'noun', '/trəˈdɪʃn/',
     'Tourists like our local traditions.', 'Du khách thích những truyền thống địa phương của chúng tôi.',
     1.0, 'Tourism', 'A1', 'Speaking Part 1 and Part 3.',
     array['Speaking', 'Listening', 'Writing'],
     array['local tradition', 'old tradition', 'keep a tradition'],
     array['custom'],
     array[]::text[],
     array['traditional', 'traditionally'],
     'Keep a tradition là giữ gìn truyền thống.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'postcard', 'bưu thiếp', 'a card you send without an envelope', 'noun', '/ˈpoʊstkɑːrd/',
     'I send a postcard to my grandmother.', 'Tôi gửi một tấm bưu thiếp cho bà tôi.',
     1.0, 'Tourism', 'A1', 'Speaking Part 1 (Travel).',
     array['Speaking', 'Listening'],
     array['send a postcard', 'buy a postcard', 'postcard from'],
     array[]::text[],
     array[]::text[],
     array['post', 'card'],
     'Postcard from + nơi chốn.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'hostel', 'nhà nghỉ, ký túc xá du lịch', 'a cheap place to stay for travellers', 'noun', '/ˈhɑːstl/',
     'We stay in a cheap hostel.', 'Chúng tôi ở trong một nhà nghỉ giá rẻ.',
     1.0, 'Tourism', 'A1', 'Speaking Part 1 and Listening.',
     array['Speaking', 'Listening'],
     array['youth hostel', 'stay in a hostel', 'cheap hostel'],
     array['guesthouse'],
     array[]::text[],
     array['hostels'],
     'Youth hostel dành cho người trẻ đi du lịch bụi.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'camping', 'cắm trại', 'the activity of staying in a tent', 'noun', '/ˈkæmpɪŋ/',
     'We go camping in the mountains.', 'Chúng tôi đi cắm trại trên núi.',
     1.0, 'Tourism', 'A1', 'Speaking Part 1 and Part 2.',
     array['Speaking', 'Listening'],
     array['go camping', 'camping trip', 'camping site'],
     array[]::text[],
     array[]::text[],
     array['camp', 'camper'],
     'Go camping là cụm cố định.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'accommodation', 'chỗ ở', 'a place to stay, like a hotel or house', 'noun', '/əˌkɑːməˈdeɪʃn/',
     'The accommodation is near the beach.', 'Chỗ ở gần bãi biển.',
     1.0, 'Tourism', 'A1', 'Listening Section 1 and Writing Task 2.',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['find accommodation', 'cheap accommodation', 'book accommodation'],
     array['lodging'],
     array[]::text[],
     array['accommodate'],
     'Không đếm được; viết đúng hai chữ c và hai chữ m.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'festival', 'lễ hội', 'a special event with music, food or traditions', 'noun', '/ˈfestɪvl/',
     'The festival is held every spring.', 'Lễ hội được tổ chức mỗi mùa xuân.',
     1.0, 'Tourism', 'A1', 'Speaking Part 1 and Part 2 (Events).',
     array['Speaking', 'Listening', 'Writing'],
     array['attend a festival', 'music festival', 'local festival'],
     array['celebration'],
     array[]::text[],
     array['festive', 'festivities'],
     'Attend a festival là tham dự lễ hội.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'historic', 'có ý nghĩa lịch sử', 'important in history', 'adjective', '/hɪˈstɔːrɪk/',
     'We visit a historic building in the town.', 'Chúng tôi thăm một toà nhà lịch sử trong thị trấn.',
     1.0, 'Tourism', 'A1', 'Speaking Part 2 and Reading.',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['historic building', 'historic site', 'historic event'],
     array['significant', 'famous'],
     array['modern'],
     array['history', 'historical', 'historian'],
     'Historic là có ý nghĩa lịch sử, historical là thuộc về lịch sử.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'ancient', 'cổ xưa', 'very old', 'adjective', '/ˈeɪnʃənt/',
     'We visit an ancient temple.', 'Chúng tôi thăm một ngôi đền cổ.',
     1.0, 'Tourism', 'A1', 'Speaking Part 2 and Reading.',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['ancient temple', 'ancient city', 'ancient history'],
     array['old', 'antique'],
     array['modern'],
     array['antiquity'],
     'Ancient city là thành phố cổ.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'landmark', 'địa danh nổi tiếng', 'a famous building or place that people recognize', 'noun', '/ˈlændmɑːrk/',
     'The tower is a famous landmark.', 'Toà tháp là một địa danh nổi tiếng.',
     1.0, 'Tourism', 'A1', 'Speaking Part 2 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['famous landmark', 'city landmark', 'historic landmark'],
     array['monument'],
     array[]::text[],
     array['land', 'mark'],
     'Landmark còn dùng nghĩa bóng: landmark decision.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'market', 'chợ', 'a place where people buy and sell goods', 'noun', '/ˈmɑːrkɪt/',
     'We buy fruit at the local market.', 'Chúng tôi mua trái cây ở chợ địa phương.',
     1.0, 'Tourism', 'A1', 'Speaking Part 1 and Part 2 (Places).',
     array['Speaking', 'Listening', 'Writing'],
     array['local market', 'night market', 'market stall'],
     array['bazaar'],
     array[]::text[],
     array['marketing', 'marketplace'],
     'Night market là chợ đêm.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'sight', 'cảnh đẹp, thắng cảnh', 'something you see, especially a famous place', 'noun', '/saɪt/',
     'The old bridge is a beautiful sight.', 'Cây cầu cổ là một cảnh đẹp.',
     1.0, 'Tourism', 'A1', 'Speaking Part 2 (Places).',
     array['Speaking', 'Listening', 'Writing'],
     array['see the sights', 'beautiful sight', 'in sight'],
     array['view', 'attraction'],
     array[]::text[],
     array['sightseeing', 'sighted'],
     'See the sights là đi tham quan các thắng cảnh.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'spot', 'địa điểm', 'a place, especially a good one', 'noun', '/spɑːt/',
     'This is a popular spot for photos.', 'Đây là một địa điểm phổ biến để chụp ảnh.',
     1.0, 'Tourism', 'A1', 'Speaking Part 2 (Places).',
     array['Speaking', 'Listening'],
     array['tourist spot', 'popular spot', 'quiet spot'],
     array['place', 'location'],
     array[]::text[],
     array['spotless'],
     'Tourist spot dùng phổ biến trong hội thoại.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'brochure', 'tờ rơi, sách giới thiệu', 'a small book with information about a place', 'noun', '/broʊˈʃʊr/',
     'The hotel gives us a brochure about tours.', 'Khách sạn đưa cho chúng tôi một tờ giới thiệu về các tour.',
     1.0, 'Tourism', 'A1', 'Listening Section 1 (Travel).',
     array['Speaking', 'Listening', 'Reading'],
     array['travel brochure', 'tour brochure', 'read a brochure'],
     array['leaflet'],
     array[]::text[],
     array['brochures'],
     'Brochure phát âm /broʊˈʃʊr/.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'cruise', 'chuyến du thuyền', 'a holiday on a large boat', 'noun', '/kruːz/',
     'We take a cruise on the bay.', 'Chúng tôi đi du thuyền trên vịnh.',
     1.0, 'Tourism', 'A1', 'Speaking Part 2 (Experiences).',
     array['Speaking', 'Listening', 'Writing'],
     array['take a cruise', 'cruise ship', 'river cruise'],
     array['boat trip'],
     array[]::text[],
     array['cruiser', 'cruising'],
     'Cruise ship là tàu du lịch.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'crowd', 'đám đông', 'a large number of people in one place', 'noun', '/kraʊd/',
     'There is a big crowd at the beach.', 'Có một đám đông lớn ở bãi biển.',
     1.0, 'Tourism', 'A1', 'Speaking Part 1 and Part 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['big crowd', 'large crowd', 'avoid the crowds'],
     array['mass'],
     array[]::text[],
     array['crowded'],
     'Crowded là tính từ tương ứng.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'coast', 'bờ biển', 'the land next to the sea', 'noun', '/koʊst/',
     'We travel along the coast by car.', 'Chúng tôi đi dọc bờ biển bằng ô tô.',
     1.0, 'Tourism', 'A1', 'Speaking Part 1 and Reading.',
     array['Speaking', 'Listening', 'Reading'],
     array['along the coast', 'east coast', 'on the coast'],
     array['shore'],
     array[]::text[],
     array['coastal', 'coastline'],
     'Coastal là tính từ: coastal city.')
  on conflict do nothing;

end $$;
