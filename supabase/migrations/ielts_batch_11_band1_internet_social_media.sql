-- BATCH 11 | BAND 1.0 | TOPIC: Internet & Social Media | PART: Core Vocabulary | NUMBER OF WORDS: 30 | CEFR: A1
-- Gợi ý: nên có unique index (set_id, word) để "on conflict do nothing" chống trùng khi chạy lại:
-- create unique index if not exists vocabularies_set_word_uidx on public.vocabularies (set_id, lower(word));

do $$
declare
  v_set_id uuid;
begin
  select id into v_set_id
  from public.vocabulary_sets
  where title = 'IELTS Band 1: Internet & Social Media' and owner_id is null
  limit 1;

  if v_set_id is null then
    insert into public.vocabulary_sets
      (owner_id, title, description, difficulty, is_public, cover_color)
    values
      (null, 'IELTS Band 1: Internet & Social Media',
       'Từ vựng IELTS chủ đề Internet & Social Media cho Band 1: mạng internet, ứng dụng, tài khoản và mạng xã hội cơ bản.',
       'easy', true, 'green')
    on conflict do nothing
    returning id into v_set_id;
  end if;

  if v_set_id is null then
    select id into v_set_id from public.vocabulary_sets where title = 'IELTS Band 1: Internet & Social Media' limit 1;
  end if;


  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'internet', 'mạng internet', 'a worldwide system that connects computers', 'noun', '/ˈɪntərnet/',
     'I use the internet every day.', 'Tôi dùng internet mỗi ngày.',
     1.0, 'Internet & Social Media', 'A1', 'Speaking Part 1 (Internet).',
     array['Speaking', 'Listening', 'Writing'],
     array['use the internet', 'on the internet', 'internet connection'],
     array['the web'],
     array[]::text[],
     array['internet user'],
     'Thường dùng với the: the internet.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'online', 'trực tuyến', 'connected to the internet', 'adjective', '/ˌɑːnˈlaɪn/',
     'I study English online.', 'Tôi học tiếng Anh trực tuyến.',
     1.0, 'Internet & Social Media', 'A1', 'Speaking Part 1 (Internet).',
     array['Speaking', 'Listening', 'Writing'],
     array['go online', 'online class', 'online shopping'],
     array['connected'],
     array['offline'],
     array['onliner'],
     'Vừa là tính từ vừa là trạng từ.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'offline', 'ngoại tuyến', 'not connected to the internet', 'adjective', '/ˌɔːfˈlaɪn/',
     'I read the book offline.', 'Tôi đọc quyển sách khi không có mạng.',
     1.0, 'Internet & Social Media', 'A1', 'Speaking Part 1 (Internet).',
     array['Speaking', 'Listening'],
     array['go offline', 'work offline', 'stay offline'],
     array['disconnected'],
     array['online'],
     array['line'],
     'Offline còn là đời thực: meet offline.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'website', 'trang web', 'a place on the internet with pages of information', 'noun', '/ˈwebsaɪt/',
     'This website has many free lessons.', 'Trang web này có nhiều bài học miễn phí.',
     1.0, 'Internet & Social Media', 'A1', 'Speaking Part 1 (Internet).',
     array['Speaking', 'Listening', 'Writing'],
     array['visit a website', 'school website', 'official website'],
     array['site'],
     array[]::text[],
     array['web', 'site'],
     'Official website là trang web chính thức.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'link', 'đường dẫn', 'a connection to another web page', 'noun', '/lɪŋk/',
     'Click the link to open the page.', 'Nhấp vào đường dẫn để mở trang.',
     1.0, 'Internet & Social Media', 'A1', 'Listening Section 1 (Instructions).',
     array['Speaking', 'Listening', 'Reading'],
     array['click a link', 'send a link', 'link to'],
     array['connection'],
     array[]::text[],
     array['linked', 'linkage'],
     'Cũng là động từ: link to a website.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'email', 'thư điện tử', 'a message sent by computer', 'noun', '/ˈiːmeɪl/',
     'I send an email to my teacher.', 'Tôi gửi thư điện tử cho giáo viên.',
     1.0, 'Internet & Social Media', 'A1', 'Speaking Part 1 and Listening Section 1.',
     array['Speaking', 'Listening', 'Writing'],
     array['send an email', 'email address', 'check email'],
     array['message'],
     array[]::text[],
     array['emailed'],
     'Cũng là động từ: email someone.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'password', 'mật khẩu', 'a secret word used to open an account', 'noun', '/ˈpæswɜːrd/',
     'Do not share your password.', 'Đừng chia sẻ mật khẩu của bạn.',
     1.0, 'Internet & Social Media', 'A1', 'Listening Section 1 (Instructions).',
     array['Speaking', 'Listening', 'Writing'],
     array['enter a password', 'strong password', 'forget a password'],
     array['passcode'],
     array[]::text[],
     array['pass', 'word'],
     'Strong password là mật khẩu khó đoán.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'account', 'tài khoản', 'a personal record on a website or bank', 'noun', '/əˈkaʊnt/',
     'I have an account on this website.', 'Tôi có một tài khoản trên trang web này.',
     1.0, 'Internet & Social Media', 'A1', 'Listening Section 1 (Booking).',
     array['Speaking', 'Listening', 'Writing'],
     array['open an account', 'bank account', 'social media account'],
     array['profile'],
     array[]::text[],
     array['accountant', 'accountable'],
     'Còn có nghĩa là bản tường thuật: an account of events.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'app', 'ứng dụng', 'a program on a phone or tablet', 'noun', '/æp/',
     'I use an app to learn English.', 'Tôi dùng một ứng dụng để học tiếng Anh.',
     1.0, 'Internet & Social Media', 'A1', 'Speaking Part 1 (Technology).',
     array['Speaking', 'Listening', 'Writing'],
     array['download an app', 'phone app', 'learning app'],
     array['application'],
     array[]::text[],
     array['application'],
     'App là dạng viết ngắn của application.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'download', 'tải xuống', 'to copy a file from the internet to your device', 'verb', '/ˌdaʊnˈloʊd/',
     'I download videos to watch offline.', 'Tôi tải video xuống để xem khi không có mạng.',
     1.0, 'Internet & Social Media', 'A1', 'Listening Section 1 (Instructions).',
     array['Speaking', 'Listening', 'Writing'],
     array['download an app', 'download a file', 'free download'],
     array['save'],
     array['upload'],
     array['downloaded', 'downloadable'],
     'Cũng là danh từ: a free download.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'upload', 'tải lên', 'to send a file from your device to the internet', 'verb', '/ˈʌploʊd/',
     'She uploads photos to her page.', 'Cô ấy tải ảnh lên trang của mình.',
     1.0, 'Internet & Social Media', 'A1', 'Speaking Part 1 (Internet).',
     array['Speaking', 'Listening', 'Writing'],
     array['upload a photo', 'upload a video', 'upload a file'],
     array['post'],
     array['download'],
     array['uploaded', 'uploader'],
     'Upload đối lập với download.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'post', 'đăng bài', 'to put a message or picture on a website', 'verb', '/poʊst/',
     'I post photos of my food online.', 'Tôi đăng ảnh đồ ăn của mình lên mạng.',
     1.0, 'Internet & Social Media', 'A1', 'Speaking Part 1 (Social Media).',
     array['Speaking', 'Listening', 'Writing'],
     array['post a photo', 'post online', 'social media post'],
     array['publish', 'share'],
     array[]::text[],
     array['poster', 'posting'],
     'Post cũng là bưu điện, cột trụ.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'follow', 'theo dõi', 'to receive someone''s posts online', 'verb', '/ˈfɑːloʊ/',
     'I follow some travel bloggers.', 'Tôi theo dõi một vài blogger du lịch.',
     1.0, 'Internet & Social Media', 'A1', 'Speaking Part 1 (Social Media).',
     array['Speaking', 'Listening'],
     array['follow someone', 'follow a page', 'follow the news'],
     array['track'],
     array['unfollow'],
     array['follower', 'following', 'unfollow'],
     'Follower là người theo dõi.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'comment', 'bình luận', 'to write an opinion about something online', 'verb', '/ˈkɑːment/',
     'People often comment on my photos.', 'Mọi người thường bình luận về ảnh của tôi.',
     1.0, 'Internet & Social Media', 'A1', 'Speaking Part 1 (Social Media).',
     array['Speaking', 'Listening', 'Writing'],
     array['comment on', 'leave a comment', 'positive comment'],
     array['remark', 'respond'],
     array[]::text[],
     array['commentary', 'commentator'],
     'Cũng là danh từ: leave a comment.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'video', 'video', 'a recording that shows moving pictures', 'noun', '/ˈvɪdioʊ/',
     'I watch short videos in my free time.', 'Tôi xem video ngắn vào thời gian rảnh.',
     1.0, 'Internet & Social Media', 'A1', 'Speaking Part 1 (Social Media).',
     array['Speaking', 'Listening'],
     array['watch a video', 'video call', 'short video'],
     array['clip'],
     array[]::text[],
     array['videos'],
     'Video call là cuộc gọi hình.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'social media', 'mạng xã hội', 'websites and apps where people share content', 'noun', '/ˌsoʊʃl ˈmiːdiə/',
     'Social media is very popular among teenagers.', 'Mạng xã hội rất phổ biến với thanh thiếu niên.',
     1.0, 'Internet & Social Media', 'A1', 'Speaking Part 1 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['use social media', 'social media platform', 'social media users'],
     array['social network'],
     array[]::text[],
     array['social', 'society'],
     'Social media dùng như danh từ số ít hoặc số nhiều đều gặp.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'network', 'mạng lưới', 'a group of people or computers connected together', 'noun', '/ˈnetwɜːrk/',
     'I keep in touch through my social network.', 'Tôi giữ liên lạc qua mạng xã hội của mình.',
     1.0, 'Internet & Social Media', 'A1', 'Speaking Part 3 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['social network', 'computer network', 'network of friends'],
     array['system'],
     array[]::text[],
     array['networking'],
     'Networking là hoạt động kết nối quan hệ.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'connect', 'kết nối', 'to join one thing to another', 'verb', '/kəˈnekt/',
     'I connect my phone to the Wi-Fi.', 'Tôi kết nối điện thoại với Wi-Fi.',
     1.0, 'Internet & Social Media', 'A1', 'Speaking Part 1 (Internet).',
     array['Speaking', 'Listening', 'Writing'],
     array['connect to', 'connect with', 'connect people'],
     array['link', 'join'],
     array['disconnect'],
     array['connection', 'connected', 'disconnect'],
     'Connect to the internet là kết nối mạng.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'Wi-Fi', 'mạng Wi-Fi', 'a system that connects devices to the internet without wires', 'noun', '/ˈwaɪfaɪ/',
     'The cafe has free Wi-Fi.', 'Quán cà phê có Wi-Fi miễn phí.',
     1.0, 'Internet & Social Media', 'A1', 'Listening Section 1 (Facilities).',
     array['Speaking', 'Listening'],
     array['free Wi-Fi', 'Wi-Fi password', 'connect to Wi-Fi'],
     array['wireless'],
     array[]::text[],
     array['wireless'],
     'Free Wi-Fi hay xuất hiện trong bài nghe về tiện ích.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'profile', 'hồ sơ cá nhân', 'information about a person on a website', 'noun', '/ˈproʊfaɪl/',
     'I update my profile picture every month.', 'Tôi cập nhật ảnh đại diện mỗi tháng.',
     1.0, 'Internet & Social Media', 'A1', 'Speaking Part 1 (Social Media).',
     array['Speaking', 'Listening', 'Writing'],
     array['profile picture', 'create a profile', 'update your profile'],
     array['account'],
     array[]::text[],
     array['profiles'],
     'Profile picture là ảnh đại diện.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'blog', 'nhật ký mạng, blog', 'a website where a person writes about their life or interests', 'noun', '/blɑːɡ/',
     'My friend writes a travel blog.', 'Bạn tôi viết một blog du lịch.',
     1.0, 'Internet & Social Media', 'A1', 'Speaking Part 1 (Hobbies).',
     array['Speaking', 'Listening', 'Writing'],
     array['write a blog', 'travel blog', 'read a blog'],
     array['weblog'],
     array[]::text[],
     array['blogger', 'blogging'],
     'Blogger là người viết blog.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'browse', 'lướt xem', 'to look at web pages or products', 'verb', '/braʊz/',
     'I browse the internet before bed.', 'Tôi lướt mạng trước khi đi ngủ.',
     1.0, 'Internet & Social Media', 'A1', 'Speaking Part 1 (Internet).',
     array['Speaking', 'Listening', 'Writing'],
     array['browse the internet', 'browse online', 'browse a website'],
     array['surf'],
     array[]::text[],
     array['browser'],
     'Browser là trình duyệt web.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'notification', 'thông báo', 'a message that tells you something new has happened', 'noun', '/ˌnoʊtɪfɪˈkeɪʃn/',
     'I turn off notifications at night.', 'Tôi tắt thông báo vào ban đêm.',
     1.0, 'Internet & Social Media', 'A1', 'Speaking Part 3 (Social Media).',
     array['Speaking', 'Listening', 'Writing'],
     array['turn off notifications', 'get a notification', 'phone notification'],
     array['alert'],
     array[]::text[],
     array['notify', 'notice'],
     'Notification thường xuất hiện ở dạng số nhiều.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'privacy', 'quyền riêng tư', 'the right to keep personal things secret', 'noun', '/ˈpraɪvəsi/',
     'Online privacy is very important.', 'Quyền riêng tư trên mạng rất quan trọng.',
     1.0, 'Internet & Social Media', 'A1', 'Speaking Part 3 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['protect privacy', 'online privacy', 'invade privacy'],
     array['confidentiality'],
     array[]::text[],
     array['private', 'privately'],
     'Protect privacy là collocation hay dùng trong Writing.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'username', 'tên đăng nhập', 'the name you use to log in to a website', 'noun', '/ˈjuːzərneɪm/',
     'Please enter your username.', 'Vui lòng nhập tên đăng nhập của bạn.',
     1.0, 'Internet & Social Media', 'A1', 'Listening Section 1 (Instructions).',
     array['Speaking', 'Listening', 'Reading'],
     array['enter a username', 'choose a username', 'username and password'],
     array['login'],
     array[]::text[],
     array['user', 'name'],
     'Thường đi cùng password.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'subscribe', 'đăng ký theo dõi', 'to pay or agree to get regular content', 'verb', '/səbˈskraɪb/',
     'I subscribe to a learning channel.', 'Tôi đăng ký theo dõi một kênh học tập.',
     1.0, 'Internet & Social Media', 'A1', 'Speaking Part 1 (Internet).',
     array['Speaking', 'Listening', 'Writing'],
     array['subscribe to', 'subscribe to a channel', 'subscribe online'],
     array['sign up'],
     array['unsubscribe'],
     array['subscriber', 'subscription'],
     'Subscription là gói đăng ký.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'popular', 'phổ biến', 'liked by many people', 'adjective', '/ˈpɑːpjələr/',
     'This app is popular with teenagers.', 'Ứng dụng này phổ biến với thanh thiếu niên.',
     1.0, 'Internet & Social Media', 'A1', 'Speaking Part 1 and Writing Task 2.',
     array['Speaking', 'Listening', 'Writing'],
     array['popular with', 'very popular', 'popular choice'],
     array['common', 'well-liked'],
     array['unpopular'],
     array['popularity', 'popularly', 'unpopular'],
     'Popular with + nhóm người.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'famous', 'nổi tiếng', 'known by many people', 'adjective', '/ˈfeɪməs/',
     'She is famous on social media.', 'Cô ấy nổi tiếng trên mạng xã hội.',
     1.0, 'Internet & Social Media', 'A1', 'Speaking Part 2 (Describe a person).',
     array['Speaking', 'Listening', 'Writing'],
     array['famous for', 'famous person', 'become famous'],
     array['well-known', 'renowned'],
     array['unknown'],
     array['fame', 'famously'],
     'Famous for + lý do nổi tiếng.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'selfie', 'ảnh tự chụp', 'a photo that you take of yourself', 'noun', '/ˈselfi/',
     'We take a selfie at the beach.', 'Chúng tôi chụp ảnh tự sướng ở bãi biển.',
     1.0, 'Internet & Social Media', 'A1', 'Speaking Part 1 (Hobbies).',
     array['Speaking', 'Listening'],
     array['take a selfie', 'selfie stick', 'post a selfie'],
     array['self-portrait'],
     array[]::text[],
     array['selfies'],
     'Selfie là từ thông dụng trong hội thoại.')
  on conflict do nothing;

  insert into public.vocabularies
    (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation, ielts_band, ielts_topic, cefr_level, ielts_use, ielts_skills, collocations, synonyms, antonyms, word_family, usage_notes)
  values
    (v_set_id, 'group', 'nhóm', 'a number of people or things together', 'noun', '/ɡruːp/',
     'I chat in a group with my classmates.', 'Tôi trò chuyện trong một nhóm với các bạn cùng lớp.',
     1.0, 'Internet & Social Media', 'A1', 'Speaking Part 1 (Social Media).',
     array['Speaking', 'Listening', 'Writing'],
     array['group chat', 'join a group', 'a group of friends'],
     array['team'],
     array['individual'],
     array['grouping', 'regroup'],
     'Group chat là nhóm trò chuyện.')
  on conflict do nothing;

end $$;
