-- =========================================================
-- ENGLISH 12 - UNIT 1: LIFE STORIES WE ADMIRE
-- Từ vựng SGK Tiếng Anh 12 (Chương trình mới)
-- =========================================================

-- ---- English 12 - Unit 1: Life Stories We Admire ----
with new_set as (
  insert into public.vocabulary_sets (owner_id, title, description, difficulty, is_public, cover_color, category, topic)
  select null, 
    'English 12 - Unit 1: Life Stories We Admire', 
    'Từ vựng Unit 1 SGK Tiếng Anh 12 - Life Stories We Admire. Chủ đề: Những câu chuyện cuộc đời đáng ngưỡng mộ.', 
    'medium', 
    true, 
    'indigo',
    'English 12',
    'Unit 1: Life Stories'
  where not exists (select 1 from public.vocabulary_sets where title = 'English 12 - Unit 1: Life Stories We Admire')
  returning id
)
insert into public.vocabularies (set_id, word, meaning, english_definition, part_of_speech, pronunciation, example, example_translation)
select id, v.word, v.meaning, v.eng_def, v.pos, v.pron, v.example, v.example_vi from new_set, (values
    -- Phonetics & Word Family
    ('diphthong', 'nguyên âm đôi', null, 'noun', '/ˈdɪfθɒŋ/', 'The word "coin" contains a diphthong.', 'Từ "coin" chứa một nguyên âm đôi.'),
    
    -- attend family
    ('attend', 'tham dự', 'go to an event', 'verb', '/əˈtend/', 'She will attend the conference next week.', 'Cô ấy sẽ tham dự hội nghị tuần sau.'),
    ('attendee', 'người tham dự', null, 'noun', '/əˌtenˈdiː/', 'All attendees must register in advance.', 'Tất cả người tham dự phải đăng ký trước.'),
    ('attendant', 'người phục vụ/người có nhiệm vụ ở một nơi để giúp khách', null, 'noun', '/əˈtendənt/', 'The flight attendant served drinks.', 'Tiếp viên hàng không phục vụ đồ uống.'),
    
    -- impress family
    ('impress', 'gây ấn tượng', 'cause somebody to admire you', 'verb', '/ɪmˈpres/', 'He tried to impress her with his knowledge.', 'Anh ấy cố gắng gây ấn tượng với cô ấy bằng kiến thức của mình.'),
    ('impression', 'ấn tượng', null, 'noun', '/ɪmˈpreʃn/', 'She made a good impression on the interviewer.', 'Cô ấy tạo ấn tượng tốt với người phỏng vấn.'),
    ('impressive', 'gây ấn tượng', null, 'adjective', '/ɪmˈpresɪv/', 'His performance was very impressive.', 'Màn trình diễn của anh ấy rất ấn tượng.'),
    
    -- marry family
    ('marry', 'kết hôn', null, 'verb', '/ˈmæri/', 'They plan to marry next summer.', 'Họ dự định kết hôn vào mùa hè năm sau.'),
    ('marriage', 'cuộc hôn nhân', null, 'noun', '/ˈmærɪdʒ/', 'Their marriage lasted 50 years.', 'Cuộc hôn nhân của họ kéo dài 50 năm.'),
    
    -- achieve family
    ('achieve', 'đạt được', null, 'verb', '/əˈtʃiːv/', 'She achieved her goal of becoming a doctor.', 'Cô ấy đã đạt được mục tiêu trở thành bác sĩ.'),
    ('achievement', 'thành tựu', null, 'noun', '/əˈtʃiːvmənt/', 'Winning the award was a great achievement.', 'Giành giải thưởng là một thành tựu lớn.'),
    ('success', 'thành công', null, 'noun', '/səkˈses/', 'Hard work leads to success.', 'Làm việc chăm chỉ dẫn đến thành công.'),
    
    -- respect family
    ('respectable', 'đáng kính, đúng đắn, thích hợp, đáng kể', null, 'adjective', '/rɪˈspektəbl/', 'He comes from a respectable family.', 'Anh ấy xuất thân từ một gia đình đáng kính.'),
    ('respectful', 'lễ phép, kính cẩn', null, 'adjective', '/rɪˈspektfl/', 'Students should be respectful to their teachers.', 'Học sinh nên lễ phép với thầy cô.'),
    ('respected', 'được tôn trọng', null, 'adjective', '/rɪˈspektɪd/', 'He is a highly respected scientist.', 'Ông ấy là một nhà khoa học rất được tôn trọng.'),
    
    -- Technology & Innovation
    ('phonograph', 'máy hát đĩa', null, 'noun', '/ˈfəʊnəɡrɑːf/', 'Edison invented the phonograph in 1877.', 'Edison đã phát minh ra máy hát đĩa năm 1877.'),
    
    -- Description
    ('specific', 'cụ thể', null, 'adjective', '/spəˈsɪfɪk/', 'Can you give me a specific example?', 'Bạn có thể cho tôi một ví dụ cụ thể không?'),
    ('setting', 'bối cảnh', null, 'noun', '/ˈsetɪŋ/', 'The movie has a beautiful setting.', 'Bộ phim có bối cảnh đẹp.'),
    ('documentary', 'phim tài liệu', null, 'noun', '/ˌdɒkjuˈmentri/', 'I watched a documentary about wildlife.', 'Tôi xem một phim tài liệu về động vật hoang dã.'),
    
    -- Weather & Nature
    ('icy', 'băng giá', null, 'adjective', '/ˈaɪsi/', 'The roads were icy this morning.', 'Đường sá băng giá sáng nay.'),
    ('light', 'đốt, thắp', null, 'verb', '/laɪt/', 'She lit a candle for dinner.', 'Cô ấy thắp một ngọn nến cho bữa tối.'),
    
    -- Talent & Intelligence
    ('genius', 'thiên tài', 'a very intelligent person', 'noun', '/ˈdʒiːniəs/', 'Einstein was a scientific genius.', 'Einstein là một thiên tài khoa học.'),
    ('genuine', 'đích thực, chân thật', 'authentic / real', 'adjective', '/ˈdʒenjuɪn/', 'She showed genuine concern for his health.', 'Cô ấy thể hiện sự quan tâm chân thật đến sức khỏe của anh ấy.'),
    ('fake', 'giả', null, 'adjective', '/feɪk/', 'The painting was a fake.', 'Bức tranh là đồ giả.'),
    
    -- create family
    ('create', 'sáng tạo', null, 'verb', '/kriˈeɪt/', 'Artists create beautiful works of art.', 'Các nghệ sĩ sáng tạo ra những tác phẩm nghệ thuật đẹp.'),
    ('creative', 'sáng tạo', null, 'adjective', '/kriˈeɪtɪv/', 'She has a very creative mind.', 'Cô ấy có một tâm trí rất sáng tạo.'),
    
    -- Military & Leadership
    ('general', 'tướng, nhà chiến lược xuất sắc', null, 'noun', '/ˈdʒenrəl/', 'General Giap was a brilliant military strategist.', 'Đại tướng Giáp là một nhà chiến lược quân sự xuất sắc.'),
    ('glossary', 'danh mục từ vựng', null, 'noun', '/ˈɡlɒsəri/', 'Check the glossary for word definitions.', 'Kiểm tra danh mục từ vựng để biết nghĩa của từ.'),
    ('military', 'quân sự, thuộc quân sự', null, 'noun/adjective', '/ˈmɪlətri/', 'He served in the military for 20 years.', 'Ông ấy phục vụ trong quân đội 20 năm.'),
    ('army', 'quân đội', null, 'noun', '/ˈɑːmi/', 'He joined the army after high school.', 'Anh ấy nhập ngũ sau khi tốt nghiệp trung học.'),
    ('Communist Party', 'Đảng Cộng sản', null, 'noun', '/ˈkɒmjənɪst ˈpɑːti/', 'Ho Chi Minh founded the Communist Party of Vietnam.', 'Hồ Chí Minh sáng lập Đảng Cộng sản Việt Nam.'),
    
    -- Actions
    ('carry out', 'tiến hành', null, 'phrasal verb', '/ˈkæri aʊt/', 'They carried out the research successfully.', 'Họ đã tiến hành nghiên cứu thành công.'),
    ('conduct', 'tiến hành', null, 'verb', '/kənˈdʌkt/', 'The team will conduct a survey next week.', 'Nhóm sẽ tiến hành một cuộc khảo sát tuần sau.'),
    ('reveal', 'tiết lộ', null, 'verb', '/rɪˈviːl/', 'The investigation revealed new evidence.', 'Cuộc điều tra đã tiết lộ bằng chứng mới.'),
    ('uncover', 'tiết lộ, phát hiện', null, 'verb', '/ʌnˈkʌvə(r)/', 'Scientists uncovered ancient ruins.', 'Các nhà khoa học phát hiện tàn tích cổ đại.'),
    
    -- Fairy Tales & Stories
    ('The Little Mermaid', 'Nàng Tiên Cá', null, 'proper noun', '/ðə ˈlɪtl ˈmɜːmeɪd/', 'The Little Mermaid is a famous Disney movie.', 'Nàng Tiên Cá là một bộ phim Disney nổi tiếng.'),
    ('Snow White and the Seven Dwarfs', 'Nàng Bạch Tuyết và bảy chú lùn', null, 'proper noun', '/snəʊ waɪt ənd ðə ˈsevn dwɔːfs/', 'Snow White was the first Disney animated film.', 'Bạch Tuyết là bộ phim hoạt hình đầu tiên của Disney.'),
    ('Cinderella', 'Lọ Lem', null, 'proper noun', '/ˌsɪndəˈrelə/', 'Cinderella lost her glass slipper at midnight.', 'Lọ Lem làm mất chiếc giày thủy tinh lúc nửa đêm.'),
    ('Beauty and the Beast', 'Người đẹp và quái vật', null, 'proper noun', '/ˈbjuːti ənd ðə biːst/', 'Beauty and the Beast is a tale of true love.', 'Người đẹp và quái vật là câu chuyện về tình yêu chân thật.'),
    
    -- Animation & Film
    ('voice', 'giọng nói / lồng tiếng', null, 'noun/verb', '/vɔɪs/', 'She has a beautiful singing voice.', 'Cô ấy có giọng hát đẹp.'),
    ('magical', 'kỳ diệu', null, 'adjective', '/ˈmædʒɪkl/', 'It was a magical evening.', 'Đó là một buổi tối kỳ diệu.'),
    ('feature-length', 'dài (90 phút hoặc hơn)', null, 'adjective', '/ˈfiːtʃə leŋθ/', 'It is the first feature-length animated film.', 'Đây là bộ phim hoạt hình dài đầu tiên.'),
    ('live-action', 'người thật / con vật thật', null, 'noun', '/lɪv ˈækʃn/', 'The new movie is a live-action adaptation.', 'Bộ phim mới là bản chuyển thể người thật.'),
    
    -- Art
    ('draw', 'vẽ', 'make a picture using a pencil or pen', 'verb', '/drɔː/', 'He can draw very realistic portraits.', 'Anh ấy có thể vẽ chân dung rất chân thực.'),
    ('paint', 'vẽ bằng màu', 'make a picture using paints', 'verb', '/peɪnt/', 'She loves to paint landscapes.', 'Cô ấy thích vẽ tranh phong cảnh.'),
    
    -- Biography
    ('biography', 'tiểu sử', null, 'noun', '/baɪˈɒɡrəfi/', 'I read a biography of Steve Jobs.', 'Tôi đã đọc tiểu sử của Steve Jobs.'),
    
    -- Expressions
    ('apart from', 'ngoại trừ', null, 'preposition', '/əˈpɑːt frɒm/', 'Apart from English, she speaks French.', 'Ngoại trừ tiếng Anh, cô ấy còn nói tiếng Pháp.'),
    ('except for', 'ngoại trừ', null, 'preposition', '/ɪkˈsept fɔː(r)/', 'Everyone passed except for two students.', 'Mọi người đều đỗ ngoại trừ hai học sinh.'),
    ('other than', 'ngoài, ngoại trừ', null, 'preposition', '/ˈʌðə ðæn/', 'Other than that, everything is fine.', 'Ngoài điều đó, mọi thứ đều ổn.'),
    ('in addition', 'ngoài ra, thêm vào đó', null, 'preposition', '/ɪn əˈdɪʃn/', 'In addition, we need more volunteers.', 'Ngoài ra, chúng tôi cần thêm tình nguyện viên.'),
    
    -- Characteristics
    ('characteristic', 'nét đặc trưng, đặc điểm', null, 'noun', '/ˌkærəktəˈrɪstɪk/', 'Honesty is his main characteristic.', 'Sự trung thực là đặc điểm chính của anh ấy.'),
    
    -- Poetry & Literature
    ('poem', 'bài thơ', null, 'noun', '/ˈpəʊɪm/', 'She wrote a beautiful poem about nature.', 'Cô ấy viết một bài thơ đẹp về thiên nhiên.'),
    ('poet', 'nhà thơ', null, 'noun', '/ˈpəʊɪt/', 'Wordsworth was a famous English poet.', 'Wordsworth là một nhà thơ Anh nổi tiếng.'),
    ('poetry', 'thơ ca', null, 'noun', '/ˈpəʊətri/', 'I enjoy reading poetry in my free time.', 'Tôi thích đọc thơ ca trong thời gian rảnh.'),
    
    -- innovate family
    ('innovate', 'đổi mới, cách tân', 'introduce changes and new ideas', 'verb', '/ˈɪnəveɪt/', 'Companies must innovate to stay competitive.', 'Các công ty phải đổi mới để duy trì tính cạnh tranh.'),
    ('innovative', 'đổi mới, sáng tạo', null, 'adjective', '/ˈɪnəvətɪv/', 'This is an innovative solution to the problem.', 'Đây là một giải pháp sáng tạo cho vấn đề.'),
    ('innovation', 'sự đổi mới', null, 'noun', '/ˌɪnəˈveɪʃn/', 'The company is known for its innovation.', 'Công ty được biết đến vì sự đổi mới.'),
    
    -- Publishing
    ('publish', 'xuất bản', null, 'verb', '/ˈpʌblɪʃ/', 'The book was published in 2020.', 'Cuốn sách được xuất bản năm 2020.'),
    
    -- Emotions (Idioms)
    ('on cloud nine', 'rất vui sướng', null, 'idiom', '/ɒn klaʊd naɪn/', 'She was on cloud nine after getting the job.', 'Cô ấy rất vui sướng sau khi nhận được công việc.'),
    ('on top of the world', 'rất vui sướng', null, 'idiom', '/ɒn tɒp əv ðə wɜːld/', 'Winning the championship made him feel on top of the world.', 'Giành chức vô địch khiến anh ấy cảm thấy rất vui sướng.'),
    ('over the moon', 'rất vui sướng', null, 'idiom', '/ˈəʊvə ðə muːn/', 'They were over the moon when they heard the news.', 'Họ rất vui sướng khi nghe tin.'),
    
    -- Leadership
    ('rule', 'thống trị', null, 'verb', '/ruːl/', 'The king ruled the country for 40 years.', 'Nhà vua thống trị đất nước 40 năm.'),
    ('ruler', 'người cai trị', null, 'noun', '/ˈruːlə(r)/', 'She was a wise and just ruler.', 'Bà ấy là một người cai trị khôn ngoan và công bằng.'),
    
    -- Reality
    ('actually', 'thật sự', null, 'adverb', '/ˈæktʃuəli/', 'I thought he was young, but he is actually 40.', 'Tôi nghĩ anh ấy trẻ, nhưng thật sự anh ấy 40 tuổi.'),
    
    -- determine family
    ('determine', 'xác định', null, 'verb', '/dɪˈtɜːmɪn/', 'We need to determine the cause of the problem.', 'Chúng ta cần xác định nguyên nhân của vấn đề.'),
    ('find out', 'tìm ra, phát hiện', null, 'phrasal verb', '/faɪnd aʊt/', 'I need to find out what happened.', 'Tôi cần tìm ra điều gì đã xảy ra.'),
    ('determined', 'quả quyết, kiên định', null, 'adjective', '/dɪˈtɜːmɪnd/', 'She is determined to succeed.', 'Cô ấy quyết tâm thành công.'),
    ('determination', 'sự quyết tâm', null, 'noun', '/dɪˌtɜːmɪˈneɪʃn/', 'His determination helped him overcome obstacles.', 'Sự quyết tâm của anh ấy giúp anh vượt qua khó khăn.'),
    ('be determined to', 'quyết tâm làm gì', null, 'phrase', '/bi dɪˈtɜːmɪnd tuː/', 'He is determined to win the race.', 'Anh ấy quyết tâm thắng cuộc đua.'),
    
    -- expand family
    ('expand', 'mở rộng, bành trướng', null, 'verb', '/ɪkˈspænd/', 'The company plans to expand overseas.', 'Công ty dự định mở rộng ra nước ngoài.'),
    ('expansion', 'sự mở rộng', null, 'noun', '/ɪkˈspænʃn/', 'The expansion of the business was successful.', 'Việc mở rộng doanh nghiệp đã thành công.'),
    
    -- defeat family
    ('defeat', 'đánh bại', null, 'verb', '/dɪˈfiːt/', 'Our team defeated the champions.', 'Đội chúng tôi đánh bại đội vô địch.'),
    ('beat', 'đánh bại', null, 'verb', '/biːt/', 'They beat us 3-0 in the final.', 'Họ đánh bại chúng tôi 3-0 ở trận chung kết.'),
    
    -- Military branches
    ('navy', 'hải quân', null, 'noun', '/ˈneɪvi/', 'He served in the navy for five years.', 'Anh ấy phục vụ trong hải quân năm năm.'),
    
    -- Size
    ('minor', 'nhỏ, thứ yếu', null, 'adjective', '/ˈmaɪnə(r)/', 'It is just a minor problem.', 'Đó chỉ là một vấn đề nhỏ.'),
    ('major', 'lớn, chủ yếu', null, 'adjective', '/ˈmeɪdʒə(r)/', 'This is a major breakthrough in science.', 'Đây là một bước đột phá lớn trong khoa học.'),
    
    -- Historical figures
    ('Catherine the Great', 'Catherine Đại đế', null, 'proper noun', '/ˈkæθrɪn ðə ɡreɪt/', 'Catherine the Great ruled Russia from 1762 to 1796.', 'Catherine Đại đế cai trị nước Nga từ 1762 đến 1796.'),
    
    -- Visual
    ('visual', 'trực quan', null, 'adjective', '/ˈvɪʒuəl/', 'Visual aids help students learn better.', 'Phương tiện trực quan giúp học sinh học tốt hơn.'),
    ('historical figure', 'nhân vật lịch sử', null, 'noun', '/hɪˈstɒrɪkl ˈfɪɡə(r)/', 'Ho Chi Minh is an important historical figure.', 'Hồ Chí Minh là một nhân vật lịch sử quan trọng.'),
    ('illustrate', 'minh họa', null, 'verb', '/ˈɪləstreɪt/', 'This example illustrates my point clearly.', 'Ví dụ này minh họa rõ quan điểm của tôi.'),
    
    -- admire family
    ('admire', 'ngưỡng mộ, chiêm ngưỡng', 'look up to / respect', 'verb', '/ədˈmaɪə(r)/', 'I admire her courage and determination.', 'Tôi ngưỡng mộ lòng dũng cảm và quyết tâm của cô ấy.'),
    ('admiration', 'sự ngưỡng mộ', null, 'noun', '/ˌædməˈreɪʃn/', 'He has great admiration for his teacher.', 'Anh ấy rất ngưỡng mộ giáo viên của mình.'),
    ('admirable', 'đáng ngưỡng mộ', null, 'adjective', '/ˈædmərəbl/', 'Her dedication is truly admirable.', 'Sự cống hiến của cô ấy thật đáng ngưỡng mộ.'),
    ('admirably', 'một cách đáng ngưỡng mộ', null, 'adverb', '/ˈædmərəbli/', 'He handled the situation admirably.', 'Anh ấy xử lý tình huống một cách đáng ngưỡng mộ.'),
    
    -- War & Military Life
    ('diary', 'nhật ký', null, 'noun', '/ˈdaɪəri/', 'She kept a diary during the war.', 'Cô ấy viết nhật ký trong chiến tranh.'),
    ('join the army', 'nhập ngũ', null, 'phrase', '/dʒɔɪn ði ˈɑːmi/', 'He joined the army at age 18.', 'Anh ấy nhập ngũ lúc 18 tuổi.'),
    ('resistance war', 'cuộc kháng chiến', null, 'noun', '/rɪˈzɪstəns wɔː(r)/', 'Vietnam fought a long resistance war.', 'Việt Nam đã trải qua cuộc kháng chiến dài.'),
    ('field hospital', 'bệnh viện dã chiến', null, 'noun', '/fiːld ˈhɒspɪtl/', 'She worked in a field hospital during the war.', 'Cô ấy làm việc tại bệnh viện dã chiến trong chiến tranh.'),
    
    -- Duties
    ('account', 'câu chuyện, tài khoản', null, 'noun', '/əˈkaʊnt/', 'This is an account of what happened.', 'Đây là câu chuyện về những gì đã xảy ra.'),
    ('do one''s duty', 'làm nhiệm vụ', null, 'phrase', '/duː wʌnz ˈdjuːti/', 'Soldiers must do their duty.', 'Người lính phải làm nhiệm vụ.'),
    
    -- Environment
    ('jungle', 'rừng', 'tropical forest', 'noun', '/ˈdʒʌŋɡl/', 'They got lost in the jungle.', 'Họ bị lạc trong rừng.'),
    ('soldier', 'người lính', null, 'noun', '/ˈsəʊldʒə(r)/', 'The soldiers marched through the town.', 'Những người lính hành quân qua thị trấn.'),
    
    -- return family
    ('return', 'trả lại; trở lại', 'send/give sth back; go/come back to a place', 'verb', '/rɪˈtɜːn/', 'He returned home after the war.', 'Anh ấy trở về nhà sau chiến tranh.'),
    
    -- Feelings
    ('amazing', 'hết sức ngạc nhiên, tuyệt vời', 'extremely surprising', 'adjective', '/əˈmeɪzɪŋ/', 'She did an amazing job on the project.', 'Cô ấy đã làm một công việc tuyệt vời trong dự án.'),
    
    -- Heroes
    ('hero', 'anh hùng', null, 'noun', '/ˈhɪərəʊ/', 'He is a war hero.', 'Ông ấy là anh hùng chiến tranh.'),
    ('heroine', 'nữ anh hùng', null, 'noun', '/ˈherəʊɪn/', 'She is considered a national heroine.', 'Cô ấy được coi là nữ anh hùng dân tộc.'),
    
    -- devote family
    ('devoted', 'tận tụy, cống hiến', null, 'adjective', '/dɪˈvəʊtɪd/', 'She is devoted to her work.', 'Cô ấy tận tụy với công việc.'),
    ('devote', 'cống hiến', null, 'verb', '/dɪˈvəʊt/', 'He devoted his life to science.', 'Ông ấy cống hiến cả đời cho khoa học.'),
    ('devotion', 'sự tận tụy, cống hiến', null, 'noun', '/dɪˈvəʊʃn/', 'Her devotion to her family is admirable.', 'Sự tận tụy của cô ấy với gia đình thật đáng ngưỡng mộ.'),
    ('be devoted to', 'tận tụy với', null, 'phrase', '/bi dɪˈvəʊtɪd tuː/', 'He is devoted to helping the poor.', 'Anh ấy tận tụy giúp người nghèo.'),
    
    -- Medical
    ('operate on', 'mổ/phẫu thuật cho ai', null, 'phrasal verb', '/ˈɒpəreɪt ɒn/', 'The doctor operated on him successfully.', 'Bác sĩ đã phẫu thuật cho anh ấy thành công.'),
    
    -- describe family
    ('describe', 'miêu tả', null, 'verb', '/dɪˈskraɪb/', 'Can you describe what you saw?', 'Bạn có thể miêu tả những gì bạn thấy không?'),
    ('description', 'sự miêu tả', null, 'noun', '/dɪˈskrɪpʃn/', 'The description of the suspect was accurate.', 'Sự miêu tả về nghi phạm rất chính xác.'),
    
    -- Family & Adoption
    ('biological', 'thuộc về sinh học', null, 'adjective', '/ˌbaɪəˈlɒdʒɪkl/', 'She met her biological parents last year.', 'Cô ấy gặp bố mẹ ruột năm ngoái.'),
    ('give up for adoption', 'đưa ai đó cho người khác nuôi', null, 'phrase', '/ɡɪv ʌp fɔːr əˈdɒpʃn/', 'She gave up her baby for adoption.', 'Cô ấy đưa con cho người khác nhận nuôi.'),
    ('adopt', 'nhận ai làm con nuôi', null, 'verb', '/əˈdɒpt/', 'They decided to adopt a child.', 'Họ quyết định nhận một đứa trẻ làm con nuôi.'),
    ('foster', 'nuôi dưỡng; thúc đẩy', 'encourage the development', 'verb', '/ˈfɒstə(r)/', 'She fostered her love of music from an early age.', 'Cô ấy nuôi dưỡng tình yêu âm nhạc từ khi còn nhỏ.'),
    
    -- bond family
    ('bond', 'gắn kết, kết nối, gắn bó', null, 'verb/noun', '/bɒnd/', 'The mother bonded with her baby immediately.', 'Người mẹ gắn bó với con ngay lập tức.'),
    ('bond over', 'gắn bó với nhau vì điều gì', null, 'phrasal verb', '/bɒnd ˈəʊvə(r)/', 'They bonded over their love of music.', 'Họ gắn bó với nhau vì tình yêu âm nhạc.'),
    
    -- Education
    ('drop out', 'bỏ học', null, 'phrasal verb', '/drɒp aʊt/', 'He dropped out of college in his second year.', 'Anh ấy bỏ học đại học năm thứ hai.'),
    
    -- Transportation
    ('van', 'xe tải', null, 'noun', '/væn/', 'They delivered the furniture in a van.', 'Họ giao đồ nội thất bằng xe tải.'),
    
    -- access family
    ('access', 'truy cập, tiếp cận', null, 'noun/verb', '/ˈækses/', 'Students have access to the library 24/7.', 'Học sinh có thể truy cập thư viện 24/7.'),
    ('accessible', 'có thể tiếp cận được', null, 'adjective', '/əkˈsesəbl/', 'The building is accessible to wheelchairs.', 'Tòa nhà có thể tiếp cận bằng xe lăn.'),
    
    -- Size & Scale
    ('huge', 'cực kỳ lớn', 'extremely large in size or amount', 'adjective', '/hjuːdʒ/', 'The project was a huge success.', 'Dự án là một thành công cực lớn.'),
    
    -- Business
    ('sale', 'doanh thu', null, 'noun', '/seɪl/', 'Sales increased by 20% this year.', 'Doanh thu tăng 20% năm nay.'),
    
    -- Technology
    ('iTunes', 'phần mềm/dịch vụ iTunes', null, 'proper noun', '/ˈaɪtjuːnz/', 'I downloaded the song from iTunes.', 'Tôi tải bài hát từ iTunes.'),
    
    -- invent family
    ('invent', 'phát minh', null, 'verb', '/ɪnˈvent/', 'Thomas Edison invented the light bulb.', 'Thomas Edison đã phát minh ra bóng đèn.'),
    ('invention', 'phát minh', null, 'noun', '/ɪnˈvenʃn/', 'The telephone was a revolutionary invention.', 'Điện thoại là một phát minh mang tính cách mạng.'),
    
    -- Modern Technology
    ('touch-screen', 'màn hình cảm ứng', null, 'adjective', '/tʌtʃ skriːn/', 'The new phone has a large touch-screen display.', 'Điện thoại mới có màn hình cảm ứng lớn.'),
    ('cutting-edge', 'tiên tiến', 'state-of-the-art', 'adjective', '/ˌkʌtɪŋ ˈedʒ/', 'They use cutting-edge technology.', 'Họ sử dụng công nghệ tiên tiến.'),
    ('state-of-the-art', 'tiên tiến, hiện đại', null, 'adjective', '/ˌsteɪt əv ði ˈɑːt/', 'The hospital has state-of-the-art equipment.', 'Bệnh viện có thiết bị hiện đại.'),
    
    -- Fashion & Style
    ('stylish', 'người tạo mẫu; đặc sắc, hợp thời trang', null, 'noun/adjective', '/ˈstaɪlɪʃ/', 'She always wears stylish clothes.', 'Cô ấy luôn mặc quần áo hợp thời trang.'),
    
    -- contribute family
    ('contribute to', 'góp phần', null, 'phrasal verb', '/kənˈtrɪbjuːt tuː/', 'Hard work contributed to his success.', 'Làm việc chăm chỉ góp phần vào thành công của anh ấy.'),
    ('contribution', 'sự đóng góp', null, 'noun', '/ˌkɒntrɪˈbjuːʃn/', 'His contribution to science was significant.', 'Sự đóng góp của ông vào khoa học rất quan trọng.'),
    
    -- Animation
    ('animation', 'sự sản xuất phim hoạt hình', null, 'noun', '/ˌænɪˈmeɪʃn/', 'Disney is famous for animation films.', 'Disney nổi tiếng về phim hoạt hình.'),
    ('animated', 'hoạt hình', null, 'adjective', '/ˈænɪmeɪtɪd/', 'Children love animated movies.', 'Trẻ em thích phim hoạt hình.'),
    ('animator', 'người làm phim hoạt hình', null, 'noun', '/ˈænɪmeɪtə(r)/', 'He works as an animator at Pixar.', 'Anh ấy làm người làm phim hoạt hình tại Pixar.'),
    
    -- Film
    ('blockbuster', 'phim bom tấn', null, 'noun', '/ˈblɒkbʌstə(r)/', 'The movie was a summer blockbuster.', 'Bộ phim là bom tấn mùa hè.'),
    
    -- Health
    ('be diagnosed with cancer', 'được chẩn đoán bị ung thư', null, 'phrase', '/bi ˌdaɪəɡˈnəʊzd wɪð ˈkænsə(r)/', 'He was diagnosed with cancer last year.', 'Ông ấy được chẩn đoán bị ung thư năm ngoái.'),
    ('diagnostic test', 'kiểm tra chẩn đoán', null, 'noun', '/ˌdaɪəɡˈnɒstɪk test/', 'She had a diagnostic test at the hospital.', 'Cô ấy đã làm kiểm tra chẩn đoán tại bệnh viện.'),
    ('diagnosis', 'sự chẩn đoán', null, 'noun', '/ˌdaɪəɡˈnəʊsɪs/', 'The doctor gave his diagnosis after the tests.', 'Bác sĩ đưa ra chẩn đoán sau các xét nghiệm.'),
    ('pancreatic', 'thuộc tuyến tụy', null, 'adjective', '/ˌpæŋkriˈætɪk/', 'He suffered from pancreatic cancer.', 'Ông ấy bị ung thư tuyến tụy.'),
    
    -- Communication
    ('statement', 'lời phát biểu, lời tuyên bố', null, 'noun', '/ˈsteɪtmənt/', 'The president made an official statement.', 'Tổng thống đã có lời tuyên bố chính thức.'),
    
    -- vision family
    ('vision', 'tầm nhìn', null, 'noun', '/ˈvɪʒn/', 'Steve Jobs had a clear vision for Apple.', 'Steve Jobs có tầm nhìn rõ ràng cho Apple.'),
    ('visionary', 'có tầm nhìn xa', null, 'adjective', '/ˈvɪʒənri/', 'He was a visionary leader.', 'Ông ấy là một nhà lãnh đạo có tầm nhìn xa.'),
    
    -- Humanity
    ('human being', 'con người', 'a person', 'noun', '/ˈhjuːmən ˈbiːɪŋ/', 'Every human being deserves respect.', 'Mọi con người đều xứng đáng được tôn trọng.'),
    ('give birth to', 'sinh, hạ sinh', 'bear – bore – born', 'phrase', '/ɡɪv bɜːθ tuː/', 'She gave birth to twins.', 'Cô ấy sinh đôi.'),
    
    -- Visual aids
    ('diagram', 'biểu đồ', null, 'noun', '/ˈdaɪəɡræm/', 'The diagram shows how the system works.', 'Biểu đồ cho thấy hệ thống hoạt động như thế nào.'),
    
    -- Career
    ('resign', 'từ chức, từ bỏ công việc/chức vụ', null, 'verb', '/rɪˈzaɪn/', 'He resigned from his position as CEO.', 'Ông ấy từ chức vị trí CEO.')
  ) as v(word, meaning, eng_def, pos, pron, example, example_vi)
on conflict do nothing;
