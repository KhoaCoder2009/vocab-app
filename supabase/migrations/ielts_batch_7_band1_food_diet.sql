-- BATCH 7 | BAND 1.0 | TOPIC: Food & Diet | PART: Core Vocabulary | NUMBER OF WORDS: 30 | CEFR: A1
-- Gợi ý: nên có unique index (set_id, word) để "on conflict do nothing" chống trùng khi chạy lại:
-- create unique index if not exists vocabularies_set_word_uidx on public.vocabularies (set_id, lower(word));

do $$
declare
  v_set_id uuid;
begin
  select id into v_set_id
  from public.vocabulary_sets
  where title = 'IELTS Band 1: Food & Diet' and owner_id is null
  limit 1;

  if v_set_id is null then
    insert into public.vocabulary_sets
      (owner_id, title, description, difficulty, is_public, cover_color)
    values
      (null, 'IELTS Band 1: Food & Diet',
       'Từ vựng IELTS chủ đề Food & Diet cho Band 1: món ăn, đồ uống, hương vị và ăn uống lành mạnh.',
       'easy', true, 'yellow')
    on conflict do nothing
    returning id into v_set_id;
  end if;

  if v_set_id is null then
    select id into v_set_id from public.vocabulary_sets where title = 'IELTS Band 1: Food & Diet' limit 1;
  end if;


  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'food', 'thức ăn', 'things that people and animals eat', 'noun', '/fuːd/',
     'My favourite food is noodles.', 'Món ăn yêu thích của tôi là mì.',
     1.0, 'Food & Diet', 'A1', 'Speaking Part 1 (Food).',
     array['Speaking', 'Listening', 'Writing'],
     array['healthy food', 'fast food', 'favourite food'],
     array['meal', 'dish'],
     array[]::text[],
     array['foodie', 'food court'],
     'Food không đếm được trong nghĩa chung.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'rice', 'cơm, gạo', 'small white grains that are cooked and eaten', 'noun', '/raɪs/',
     'We eat rice every day.', 'Chúng tôi ăn cơm mỗi ngày.',
     1.0, 'Food & Diet', 'A1', 'Speaking Part 1 (Food).',
     array['Speaking', 'Listening', 'Reading'],
     array['cooked rice', 'rice field', 'fried rice'],
     array[]::text[],
     array[]::text[],
     array['ricebowl'],
     'Không đếm được: a bowl of rice.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'bread', 'bánh mì', 'food made from flour and baked', 'noun', '/bred/',
     'I have bread for breakfast.', 'Tôi ăn bánh mì vào bữa sáng.',
     1.0, 'Food & Diet', 'A1', 'Speaking Part 1 (Food).',
     array['Speaking', 'Listening'],
     array['fresh bread', 'slice of bread', 'bread and butter'],
     array[]::text[],
     array[]::text[],
     array['breadcrumb'],
     'Không đếm được: a slice of bread.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'noodles', 'mì', 'long thin food made from flour', 'noun', '/ˈnuːdlz/',
     'My mother makes noodle soup.', 'Mẹ tôi nấu súp mì.',
     1.0, 'Food & Diet', 'A1', 'Speaking Part 1 (Food).',
     array['Speaking', 'Listening'],
     array['noodle soup', 'fried noodles', 'instant noodles'],
     array['pasta'],
     array[]::text[],
     array['noodle'],
     'Thường dùng ở dạng số nhiều.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'meat', 'thịt', 'the soft part of an animal used as food', 'noun', '/miːt/',
     'I do not eat much meat.', 'Tôi không ăn nhiều thịt.',
     1.0, 'Food & Diet', 'A1', 'Speaking Part 1 (Food).',
     array['Speaking', 'Listening', 'Writing'],
     array['red meat', 'eat meat', 'fresh meat'],
     array[]::text[],
     array[]::text[],
     array['meaty'],
     'Không đếm được; đừng nhầm với meet (gặp).')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'chicken', 'thịt gà, con gà', 'a bird kept for its eggs and meat', 'noun', '/ˈtʃɪkɪn/',
     'We have chicken and rice for lunch.', 'Chúng tôi ăn cơm gà cho bữa trưa.',
     1.0, 'Food & Diet', 'A1', 'Speaking Part 1 (Food).',
     array['Speaking', 'Listening'],
     array['fried chicken', 'chicken soup', 'roast chicken'],
     array['hen'],
     array[]::text[],
     array['chickens'],
     'Chicken vừa là con gà vừa là thịt gà.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'egg', 'trứng', 'an oval object laid by birds used as food', 'noun', '/eɡ/',
     'I eat an egg every morning.', 'Tôi ăn một quả trứng mỗi sáng.',
     1.0, 'Food & Diet', 'A1', 'Speaking Part 1 (Food).',
     array['Speaking', 'Listening'],
     array['boiled egg', 'fried egg', 'egg white'],
     array[]::text[],
     array[]::text[],
     array['eggs'],
     'Đếm được: one egg, two eggs.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'vegetable', 'rau củ', 'a plant that is eaten as food', 'noun', '/ˈvedʒtəbl/',
     'I eat vegetables with every meal.', 'Tôi ăn rau trong mọi bữa ăn.',
     1.0, 'Food & Diet', 'A1', 'Speaking Part 1 (Food).',
     array['Speaking', 'Listening', 'Writing'],
     array['fresh vegetables', 'green vegetables', 'vegetable soup'],
     array[]::text[],
     array['meat'],
     array['vegetarian', 'vegetation'],
     'Thường dùng ở số nhiều.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'fruit', 'trái cây', 'a sweet food that grows on trees or plants', 'noun', '/fruːt/',
     'I eat fruit after dinner.', 'Tôi ăn trái cây sau bữa tối.',
     1.0, 'Food & Diet', 'A1', 'Speaking Part 1 (Food).',
     array['Speaking', 'Listening', 'Writing'],
     array['fresh fruit', 'fruit juice', 'tropical fruit'],
     array[]::text[],
     array[]::text[],
     array['fruity', 'fruitful'],
     'Thường không đếm được: some fruit.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'apple', 'quả táo', 'a round fruit with red or green skin', 'noun', '/ˈæpl/',
     'An apple a day is good for health.', 'Mỗi ngày một quả táo tốt cho sức khoẻ.',
     1.0, 'Food & Diet', 'A1', 'Speaking Part 1 (Food).',
     array['Speaking', 'Listening'],
     array['red apple', 'apple juice', 'eat an apple'],
     array[]::text[],
     array[]::text[],
     array['apples'],
     'An apple: dùng an trước nguyên âm.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'banana', 'quả chuối', 'a long yellow fruit', 'noun', '/bəˈnænə/',
     'I eat a banana before class.', 'Tôi ăn một quả chuối trước giờ học.',
     1.0, 'Food & Diet', 'A1', 'Speaking Part 1 (Food).',
     array['Speaking', 'Listening'],
     array['ripe banana', 'banana skin', 'eat a banana'],
     array[]::text[],
     array[]::text[],
     array['bananas'],
     'Nhấn âm thứ hai: ba-NA-na.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'milk', 'sữa', 'a white drink from cows', 'noun', '/mɪlk/',
     'I drink milk every morning.', 'Tôi uống sữa mỗi sáng.',
     1.0, 'Food & Diet', 'A1', 'Speaking Part 1 (Food).',
     array['Speaking', 'Listening'],
     array['drink milk', 'fresh milk', 'glass of milk'],
     array[]::text[],
     array[]::text[],
     array['milky'],
     'Không đếm được: a glass of milk.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'juice', 'nước ép', 'a drink made from fruit', 'noun', '/dʒuːs/',
     'I like orange juice.', 'Tôi thích nước cam ép.',
     1.0, 'Food & Diet', 'A1', 'Speaking Part 1 (Food).',
     array['Speaking', 'Listening'],
     array['orange juice', 'apple juice', 'fresh juice'],
     array[]::text[],
     array[]::text[],
     array['juicy'],
     'Fresh juice là nước ép tươi.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'coffee', 'cà phê', 'a hot drink made from beans', 'noun', '/ˈkɔːfi/',
     'My father drinks coffee at work.', 'Bố tôi uống cà phê ở chỗ làm.',
     1.0, 'Food & Diet', 'A1', 'Speaking Part 1 (Food).',
     array['Speaking', 'Listening'],
     array['drink coffee', 'cup of coffee', 'iced coffee'],
     array[]::text[],
     array[]::text[],
     array['coffeehouse'],
     'Cà phê rất phổ biến ở Việt Nam.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'sugar', 'đường', 'a sweet white substance added to food', 'noun', '/ˈʃʊɡər/',
     'I do not put sugar in my tea.', 'Tôi không cho đường vào trà.',
     1.0, 'Food & Diet', 'A1', 'Speaking Part 1 (Food).',
     array['Speaking', 'Listening', 'Writing'],
     array['add sugar', 'sugar-free', 'too much sugar'],
     array[]::text[],
     array[]::text[],
     array['sugary'],
     'Too much sugar là cụm hay dùng về sức khoẻ.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'salt', 'muối', 'a white substance used to add flavour', 'noun', '/sɔːlt/',
     'Please pass the salt.', 'Làm ơn đưa giúp tôi lọ muối.',
     1.0, 'Food & Diet', 'A1', 'Speaking Part 1 (Food).',
     array['Speaking', 'Listening'],
     array['add salt', 'salt and pepper', 'too much salt'],
     array[]::text[],
     array[]::text[],
     array['salty'],
     'Salt và sugar dễ nhầm với nhau khi nấu.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'soup', 'súp, canh', 'a liquid food made from meat or vegetables', 'noun', '/suːp/',
     'Hot soup is good on cold days.', 'Súp nóng rất hợp với những ngày lạnh.',
     1.0, 'Food & Diet', 'A1', 'Speaking Part 1 (Food).',
     array['Speaking', 'Listening'],
     array['hot soup', 'vegetable soup', 'bowl of soup'],
     array['broth'],
     array[]::text[],
     array['soupy'],
     'Dùng động từ eat hoặc have soup.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'cake', 'bánh ngọt', 'a sweet food baked from flour and sugar', 'noun', '/keɪk/',
     'We eat cake on birthdays.', 'Chúng tôi ăn bánh vào ngày sinh nhật.',
     1.0, 'Food & Diet', 'A1', 'Speaking Part 1 (Food).',
     array['Speaking', 'Listening'],
     array['birthday cake', 'chocolate cake', 'slice of cake'],
     array[]::text[],
     array[]::text[],
     array['cupcake'],
     'Piece of cake còn là thành ngữ: rất dễ.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'snack', 'đồ ăn vặt', 'a small amount of food eaten between meals', 'noun', '/snæk/',
     'I have a snack after school.', 'Tôi ăn vặt sau giờ học.',
     1.0, 'Food & Diet', 'A1', 'Speaking Part 1 (Food).',
     array['Speaking', 'Listening', 'Writing'],
     array['have a snack', 'healthy snack', 'snack bar'],
     array['bite'],
     array[]::text[],
     array['snacking'],
     'Cũng là động từ: snack on fruit.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'restaurant', 'nhà hàng', 'a place where you pay to eat meals', 'noun', '/ˈrestrɑːnt/',
     'We eat at a restaurant on Sundays.', 'Chúng tôi ăn ở nhà hàng vào Chủ nhật.',
     1.0, 'Food & Diet', 'A1', 'Speaking Part 1 (Food).',
     array['Speaking', 'Listening'],
     array['eat at a restaurant', 'book a table', 'local restaurant'],
     array['diner'],
     array[]::text[],
     array['restaurateur'],
     'Book a table là đặt bàn.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'menu', 'thực đơn', 'a list of food and drinks in a restaurant', 'noun', '/ˈmenjuː/',
     'The menu has many local dishes.', 'Thực đơn có nhiều món địa phương.',
     1.0, 'Food & Diet', 'A1', 'Listening Section 1 (Restaurant).',
     array['Speaking', 'Listening'],
     array['look at the menu', 'set menu', 'on the menu'],
     array[]::text[],
     array[]::text[],
     array['menus'],
     'Thường xuất hiện trong bài nghe về đặt bàn.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'delicious', 'ngon', 'having a very good taste', 'adjective', '/dɪˈlɪʃəs/',
     'The soup is delicious.', 'Món súp rất ngon.',
     1.0, 'Food & Diet', 'A1', 'Speaking Part 1 (Food).',
     array['Speaking', 'Listening', 'Writing'],
     array['delicious food', 'taste delicious', 'absolutely delicious'],
     array['tasty', 'yummy'],
     array['disgusting'],
     array['deliciously'],
     'Delicious mạnh hơn tasty.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'hungry', 'đói', 'wanting to eat food', 'adjective', '/ˈhʌŋɡri/',
     'I am hungry after school.', 'Tôi đói sau giờ học.',
     1.0, 'Food & Diet', 'A1', 'Speaking Part 1 (Food).',
     array['Speaking', 'Listening'],
     array['feel hungry', 'get hungry', 'go hungry'],
     array['starving'],
     array['full'],
     array['hunger', 'hungrily'],
     'Hungry for nghĩa là khao khát điều gì.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'thirsty', 'khát', 'wanting to drink', 'adjective', '/ˈθɜːrsti/',
     'I feel thirsty after football.', 'Tôi cảm thấy khát sau khi đá bóng.',
     1.0, 'Food & Diet', 'A1', 'Speaking Part 1 (Food).',
     array['Speaking', 'Listening'],
     array['feel thirsty', 'get thirsty', 'thirsty work'],
     array['parched'],
     array[]::text[],
     array['thirst'],
     'Thirst là danh từ chỉ cơn khát.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'sweet', 'ngọt', 'having a taste like sugar', 'adjective', '/swiːt/',
     'This cake is too sweet for me.', 'Chiếc bánh này quá ngọt đối với tôi.',
     1.0, 'Food & Diet', 'A1', 'Speaking Part 1 (Food).',
     array['Speaking', 'Listening'],
     array['sweet taste', 'sweet food', 'too sweet'],
     array['sugary'],
     array['bitter', 'sour'],
     array['sweetness', 'sweeten', 'sweets'],
     'Sweets (Anh-Anh) nghĩa là kẹo.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'spicy', 'cay', 'having a strong hot flavour', 'adjective', '/ˈspaɪsi/',
     'I like spicy noodles.', 'Tôi thích mì cay.',
     1.0, 'Food & Diet', 'A1', 'Speaking Part 1 (Food).',
     array['Speaking', 'Listening'],
     array['spicy food', 'spicy soup', 'very spicy'],
     array['hot'],
     array['mild'],
     array['spice', 'spiciness'],
     'Spicy chỉ vị cay nồng, hot cũng có thể chỉ nhiệt độ.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'fresh', 'tươi', 'new and not old or preserved', 'adjective', '/freʃ/',
     'We buy fresh vegetables at the market.', 'Chúng tôi mua rau tươi ở chợ.',
     1.0, 'Food & Diet', 'A1', 'Speaking Part 1 (Food).',
     array['Speaking', 'Listening', 'Writing'],
     array['fresh fruit', 'fresh air', 'fresh food'],
     array['new'],
     array['stale', 'rotten'],
     array['freshly', 'freshness', 'freshen'],
     'Fresh air (không khí trong lành) rất hay gặp.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'healthy', 'lành mạnh', 'good for your body', 'adjective', '/ˈhelθi/',
     'Fruit and vegetables are healthy.', 'Trái cây và rau củ rất tốt cho sức khoẻ.',
     1.0, 'Food & Diet', 'A1', 'Speaking Part 1 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['healthy food', 'healthy diet', 'healthy lifestyle'],
     array['nutritious', 'fit'],
     array['unhealthy'],
     array['health', 'healthily'],
     'Healthy diet là collocation quan trọng cho Writing.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'diet', 'chế độ ăn', 'the food that a person usually eats', 'noun', '/ˈdaɪət/',
     'A healthy diet includes fruit and vegetables.', 'Một chế độ ăn lành mạnh gồm trái cây và rau củ.',
     1.0, 'Food & Diet', 'A1', 'Speaking Part 1 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['healthy diet', 'balanced diet', 'go on a diet'],
     array['regime'],
     array[]::text[],
     array['dietary', 'dietitian'],
     'Be on a diet nghĩa là đang ăn kiêng.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'taste', 'vị, nếm', 'the flavour of food, or to try food', 'noun', '/teɪst/',
     'The soup has a good taste.', 'Món súp có vị rất ngon.',
     1.0, 'Food & Diet', 'A1', 'Speaking Part 1 (Food).',
     array['Speaking', 'Listening', 'Writing'],
     array['good taste', 'taste good', 'taste of'],
     array['flavour'],
     array[]::text[],
     array['tasty', 'tasteless'],
     'Cũng là động từ: It tastes sweet.')
  on conflict do nothing;

end $$;
