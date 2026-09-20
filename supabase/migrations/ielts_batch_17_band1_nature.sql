-- BATCH 17 | BAND 1.0 | TOPIC: Nature | PART: Core Vocabulary | NUMBER OF WORDS: 30 | CEFR: A1
-- Gợi ý: nên có unique index (set_id, word) để "on conflict do nothing" chống trùng khi chạy lại:
-- create unique index if not exists vocabularies_set_word_uidx on public.vocabularies (set_id, lower(word));

do $$
declare
  v_set_id uuid;
begin
  select id into v_set_id
  from public.vocabulary_sets
  where title = 'IELTS Band 1: Nature' and owner_id is null
  limit 1;

  if v_set_id is null then
    insert into public.vocabulary_sets
      (owner_id, title, description, difficulty, is_public, cover_color)
    values
      (null, 'IELTS Band 1: Nature',
       'Từ vựng IELTS chủ đề Nature cho Band 1: núi, rừng, biển, bầu trời và phong cảnh thiên nhiên cơ bản.',
       'easy', true, 'green')
    on conflict do nothing
    returning id into v_set_id;
  end if;

  if v_set_id is null then
    select id into v_set_id from public.vocabulary_sets where title = 'IELTS Band 1: Nature' limit 1;
  end if;


  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'mountain', 'núi', 'a very high hill', 'noun', '/ˈmaʊntn/',
     'We climb the mountain at the weekend.', 'Chúng tôi leo núi vào cuối tuần.',
     1.0, 'Nature', 'A1', 'Speaking Part 1 and Part 2 (Places).',
     array['Speaking', 'Listening', 'Reading'],
     array['climb a mountain', 'high mountain', 'mountain top'],
     array['peak'],
     array[]::text[],
     array['mountainous', 'mountaineer'],
     'Climb a mountain là leo núi.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'hill', 'ngọn đồi', 'a small area of high land', 'noun', '/hɪl/',
     'There is a small hill behind my house.', 'Có một ngọn đồi nhỏ phía sau nhà tôi.',
     1.0, 'Nature', 'A1', 'Speaking Part 1 (Places).',
     array['Speaking', 'Listening', 'Reading'],
     array['climb a hill', 'green hill', 'hill top'],
     array['slope'],
     array['valley'],
     array['hilly', 'hillside'],
     'Hill thấp hơn mountain.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'forest', 'khu rừng', 'a large area with many trees', 'noun', '/ˈfɔːrɪst/',
     'Many animals live in the forest.', 'Nhiều loài động vật sống trong rừng.',
     1.0, 'Nature', 'A1', 'Speaking Part 1 and Writing Task 2.',
     array['Speaking', 'Listening', 'Reading', 'Writing'],
     array['tropical forest', 'deep forest', 'forest fire'],
     array['woods'],
     array[]::text[],
     array['forestry', 'deforestation'],
     'Forest fire là cháy rừng.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'beach', 'bãi biển', 'an area of sand next to the sea', 'noun', '/biːtʃ/',
     'We swim at the beach every summer.', 'Chúng tôi bơi ở bãi biển mỗi mùa hè.',
     1.0, 'Nature', 'A1', 'Speaking Part 1 and Part 2 (Places).',
     array['Speaking', 'Listening', 'Writing'],
     array['walk on the beach', 'sandy beach', 'beach holiday'],
     array['seaside'],
     array[]::text[],
     array['beachfront'],
     'Sandy beach là bãi biển cát.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'sand', 'cát', 'tiny pieces of rock on a beach', 'noun', '/sænd/',
     'The sand is hot in summer.', 'Cát nóng vào mùa hè.',
     1.0, 'Nature', 'A1', 'Speaking Part 1 (Places).',
     array['Speaking', 'Listening'],
     array['white sand', 'sand castle', 'soft sand'],
     array[]::text[],
     array[]::text[],
     array['sandy', 'sandal'],
     'Sandy là tính từ: nhiều cát.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'island', 'hòn đảo', 'land with water all around it', 'noun', '/ˈaɪlənd/',
     'We visit a small island every year.', 'Chúng tôi thăm một hòn đảo nhỏ mỗi năm.',
     1.0, 'Nature', 'A1', 'Speaking Part 1 and Part 2 (Places).',
     array['Speaking', 'Listening', 'Reading'],
     array['small island', 'tropical island', 'on an island'],
     array['isle'],
     array[]::text[],
     array['islander'],
     'Chữ s trong island là âm câm.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'waterfall', 'thác nước', 'a place where water falls from a high place', 'noun', '/ˈwɔːtərfɔːl/',
     'The waterfall is very beautiful.', 'Thác nước rất đẹp.',
     1.0, 'Nature', 'A1', 'Speaking Part 2 (Places).',
     array['Speaking', 'Listening', 'Reading'],
     array['beautiful waterfall', 'high waterfall', 'visit a waterfall'],
     array['cascade'],
     array[]::text[],
     array['water', 'fall'],
     'Từ ghép: water + fall.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'flower', 'bông hoa', 'the colourful part of a plant', 'noun', '/ˈflaʊər/',
     'She grows flowers in her garden.', 'Cô ấy trồng hoa trong vườn.',
     1.0, 'Nature', 'A1', 'Speaking Part 1 (Nature).',
     array['Speaking', 'Listening'],
     array['pick a flower', 'flower garden', 'beautiful flowers'],
     array['bloom'],
     array[]::text[],
     array['flowery', 'flowerbed'],
     'Cũng là động từ: The tree flowers in spring.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'grass', 'cỏ', 'a green plant that covers the ground', 'noun', '/ɡræs/',
     'The children sit on the grass.', 'Bọn trẻ ngồi trên cỏ.',
     1.0, 'Nature', 'A1', 'Speaking Part 1 (Nature).',
     array['Speaking', 'Listening'],
     array['green grass', 'cut the grass', 'long grass'],
     array['lawn'],
     array[]::text[],
     array['grassy', 'grassland'],
     'Không đếm được: some grass.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'leaf', 'chiếc lá', 'a flat green part of a plant', 'noun', '/liːf/',
     'The leaves fall in autumn.', 'Lá rụng vào mùa thu.',
     1.0, 'Nature', 'A1', 'Speaking Part 1 (Nature).',
     array['Speaking', 'Listening', 'Reading'],
     array['green leaf', 'fall leaves', 'dry leaf'],
     array[]::text[],
     array[]::text[],
     array['leaves', 'leafy'],
     'Số nhiều bất quy tắc là leaves.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'rock', 'tảng đá', 'a large piece of stone', 'noun', '/rɑːk/',
     'We sit on a big rock near the river.', 'Chúng tôi ngồi trên một tảng đá lớn gần sông.',
     1.0, 'Nature', 'A1', 'Speaking Part 1 and Reading.',
     array['Speaking', 'Listening', 'Reading'],
     array['big rock', 'climb a rock', 'rock formation'],
     array['boulder'],
     array[]::text[],
     array['rocky', 'rock climbing'],
     'Rock còn là loại nhạc rock.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'stone', 'hòn đá', 'a small piece of rock', 'noun', '/stoʊn/',
     'The child throws a stone into the lake.', 'Đứa trẻ ném một hòn đá xuống hồ.',
     1.0, 'Nature', 'A1', 'Speaking Part 1 (Nature).',
     array['Speaking', 'Listening', 'Reading'],
     array['throw a stone', 'stone wall', 'precious stone'],
     array['pebble'],
     array[]::text[],
     array['stony', 'stoneage'],
     'Stone là danh từ, cũng dùng làm tính từ: stone wall.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'field', 'cánh đồng', 'an area of open land used for farming', 'noun', '/fiːld/',
     'The rice field is green and wide.', 'Cánh đồng lúa xanh và rộng.',
     1.0, 'Nature', 'A1', 'Speaking Part 1 (Countryside).',
     array['Speaking', 'Listening', 'Reading'],
     array['rice field', 'green field', 'work in the field'],
     array['meadow'],
     array[]::text[],
     array['fieldwork'],
     'Field còn có nghĩa là lĩnh vực: in the field of science.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'valley', 'thung lũng', 'a low area between hills or mountains', 'noun', '/ˈvæli/',
     'The village is in a green valley.', 'Ngôi làng nằm trong một thung lũng xanh.',
     1.0, 'Nature', 'A1', 'Speaking Part 2 and Reading.',
     array['Speaking', 'Listening', 'Reading'],
     array['green valley', 'deep valley', 'river valley'],
     array['dale'],
     array['hill'],
     array['valleys'],
     'River valley là thung lũng sông.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'cave', 'hang động', 'a large hole in a hill or under the ground', 'noun', '/keɪv/',
     'We go inside a big cave.', 'Chúng tôi đi vào một hang động lớn.',
     1.0, 'Nature', 'A1', 'Speaking Part 2 (Places).',
     array['Speaking', 'Listening', 'Reading'],
     array['deep cave', 'explore a cave', 'cave paintings'],
     array['cavern'],
     array[]::text[],
     array['caves', 'caveman'],
     'Explore a cave là khám phá hang động.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'desert', 'sa mạc', 'a large dry area with little water', 'noun', '/ˈdezərt/',
     'Few plants grow in the desert.', 'Ít loài cây mọc ở sa mạc.',
     1.0, 'Nature', 'A1', 'Speaking Part 1 and Reading.',
     array['Speaking', 'Listening', 'Reading'],
     array['hot desert', 'desert climate', 'cross a desert'],
     array['wasteland'],
     array[]::text[],
     array['desertification'],
     'Desert /ˈdezərt/ khác dessert /dɪˈzɜːrt/.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'cloud', 'đám mây', 'a white or grey mass in the sky', 'noun', '/klaʊd/',
     'There are dark clouds in the sky.', 'Có những đám mây đen trên bầu trời.',
     1.0, 'Nature', 'A1', 'Speaking Part 1 (Weather).',
     array['Speaking', 'Listening'],
     array['dark cloud', 'white cloud', 'cloud cover'],
     array[]::text[],
     array[]::text[],
     array['cloudy', 'clouds'],
     'Cloudy là tính từ: nhiều mây.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'sky', 'bầu trời', 'the space above the earth', 'noun', '/skaɪ/',
     'The sky is blue and clear today.', 'Hôm nay bầu trời xanh và trong.',
     1.0, 'Nature', 'A1', 'Speaking Part 1 (Weather).',
     array['Speaking', 'Listening', 'Writing'],
     array['blue sky', 'clear sky', 'night sky'],
     array['heavens'],
     array[]::text[],
     array['skies', 'skyline'],
     'Clear sky là bầu trời quang đãng.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'moon', 'mặt trăng', 'the bright object in the sky at night', 'noun', '/muːn/',
     'The moon is very bright tonight.', 'Đêm nay mặt trăng rất sáng.',
     1.0, 'Nature', 'A1', 'Speaking Part 1 (Nature).',
     array['Speaking', 'Listening', 'Reading'],
     array['full moon', 'new moon', 'moon light'],
     array[]::text[],
     array[]::text[],
     array['moonlight', 'lunar'],
     'Full moon là trăng tròn.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'star', 'ngôi sao', 'a bright point of light in the night sky', 'noun', '/stɑːr/',
     'We look at the stars at night.', 'Chúng tôi ngắm sao vào ban đêm.',
     1.0, 'Nature', 'A1', 'Speaking Part 1 (Nature).',
     array['Speaking', 'Listening'],
     array['bright star', 'shining star', 'look at the stars'],
     array[]::text[],
     array[]::text[],
     array['starry', 'stardom'],
     'Star còn là ngôi sao điện ảnh.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'view', 'cảnh quan', 'what you can see from a place', 'noun', '/vjuː/',
     'The view from the top is amazing.', 'Cảnh nhìn từ trên đỉnh thật tuyệt vời.',
     1.0, 'Nature', 'A1', 'Speaking Part 2 (Places).',
     array['Speaking', 'Listening', 'Writing'],
     array['beautiful view', 'great view', 'view of the sea'],
     array['scenery'],
     array[]::text[],
     array['viewer', 'viewpoint'],
     'View còn là quan điểm: in my view.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'beautiful', 'đẹp', 'very pleasant to look at', 'adjective', '/ˈbjuːtɪfl/',
     'The lake is beautiful in the morning.', 'Hồ rất đẹp vào buổi sáng.',
     1.0, 'Nature', 'A1', 'Speaking Part 1 and Part 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['beautiful scenery', 'beautiful place', 'beautiful view'],
     array['lovely', 'gorgeous'],
     array['ugly'],
     array['beauty', 'beautifully', 'beautify'],
     'Beautiful nói cả về người và cảnh vật.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'peaceful', 'yên bình', 'calm and quiet', 'adjective', '/ˈpiːsfl/',
     'The village is peaceful and quiet.', 'Ngôi làng yên bình và tĩnh lặng.',
     1.0, 'Nature', 'A1', 'Speaking Part 1 and Part 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['peaceful place', 'peaceful life', 'peaceful atmosphere'],
     array['calm', 'tranquil'],
     array['noisy', 'busy'],
     array['peace', 'peacefully'],
     'Peaceful place là cách mô tả nơi rất hay dùng.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'wood', 'gỗ, rừng nhỏ', 'the hard material from trees', 'noun', '/wʊd/',
     'The table is made of wood.', 'Cái bàn làm bằng gỗ.',
     1.0, 'Nature', 'A1', 'Speaking Part 1 (Objects).',
     array['Speaking', 'Listening', 'Reading'],
     array['made of wood', 'wood table', 'piece of wood'],
     array['timber'],
     array[]::text[],
     array['wooden', 'woods'],
     'Wood còn là khu rừng nhỏ: in the woods.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'branch', 'cành cây', 'a part of a tree that grows out from the trunk', 'noun', '/bræntʃ/',
     'A bird sits on a tree branch.', 'Một con chim đậu trên cành cây.',
     1.0, 'Nature', 'A1', 'Speaking Part 1 (Nature).',
     array['Speaking', 'Listening', 'Reading'],
     array['tree branch', 'long branch', 'branch of a tree'],
     array['limb'],
     array[]::text[],
     array['branches'],
     'Branch cũng là chi nhánh công ty.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'seed', 'hạt giống', 'a small part of a plant that grows into a new plant', 'noun', '/siːd/',
     'We put the seeds in the soil.', 'Chúng tôi gieo hạt giống xuống đất.',
     1.0, 'Nature', 'A1', 'Speaking Part 1 and Reading.',
     array['Speaking', 'Listening', 'Reading'],
     array['plant seeds', 'sunflower seeds', 'seed grows'],
     array[]::text[],
     array[]::text[],
     array['seedling'],
     'Plant seeds là gieo hạt.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'sunrise', 'bình minh', 'the time when the sun comes up', 'noun', '/ˈsʌnraɪz/',
     'We watch the sunrise on the beach.', 'Chúng tôi ngắm bình minh trên bãi biển.',
     1.0, 'Nature', 'A1', 'Speaking Part 2 (Experiences).',
     array['Speaking', 'Listening'],
     array['watch the sunrise', 'at sunrise', 'beautiful sunrise'],
     array['dawn'],
     array['sunset'],
     array['sun', 'rise'],
     'Dawn trang trọng hơn sunrise.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'sunset', 'hoàng hôn', 'the time when the sun goes down', 'noun', '/ˈsʌnset/',
     'The sunset over the sea is beautiful.', 'Hoàng hôn trên biển rất đẹp.',
     1.0, 'Nature', 'A1', 'Speaking Part 2 (Experiences).',
     array['Speaking', 'Listening'],
     array['watch the sunset', 'at sunset', 'beautiful sunset'],
     array['dusk'],
     array['sunrise'],
     array['sun', 'set'],
     'Sunset và sunrise là cặp từ trái nghĩa.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'rainbow', 'cầu vồng', 'a curve of colours in the sky after rain', 'noun', '/ˈreɪnboʊ/',
     'We see a rainbow after the rain.', 'Chúng tôi thấy cầu vồng sau cơn mưa.',
     1.0, 'Nature', 'A1', 'Speaking Part 1 (Weather).',
     array['Speaking', 'Listening'],
     array['see a rainbow', 'colours of the rainbow', 'beautiful rainbow'],
     array[]::text[],
     array[]::text[],
     array['rain', 'bow'],
     'Rainbow có bảy màu.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'scenery', 'phong cảnh', 'the natural view of a place', 'noun', '/ˈsiːnəri/',
     'The scenery in the mountains is amazing.', 'Phong cảnh ở vùng núi thật tuyệt vời.',
     1.0, 'Nature', 'A1', 'Speaking Part 2 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['beautiful scenery', 'stunning scenery', 'enjoy the scenery'],
     array['landscape', 'view'],
     array[]::text[],
     array['scenic'],
     'Không đếm được: some scenery.')
  on conflict do nothing;

end $$;
