-- =========================================================
-- SEED DATA — 15 bộ từ vựng mẫu, mỗi bộ 20-22 từ
-- Chạy sau khi đã chạy 0001_init.sql
-- Có thể chạy nhiều lần, sẽ bỏ qua nếu đã tồn tại
-- =========================================================

-- ---- IELTS Environment ----
with new_set as (
  insert into public.vocabulary_sets (owner_id, title, description, difficulty, is_public, cover_color)
  select null, 'IELTS Environment', 'Từ vựng IELTS chủ đề Môi trường — thường gặp trong Writing Task 2 và Speaking Part 3.', 'hard', true, 'teal'
  where not exists (select 1 from public.vocabulary_sets where title = 'IELTS Environment')
  returning id
)
insert into public.vocabularies (set_id, word, meaning, part_of_speech, pronunciation, example, example_translation)
select id, v.word, v.meaning, v.pos, v.pron, v.example, v.example_vi from new_set, (values
    ('environment', 'môi trường', 'noun', '/ɪnˈvaɪrənmənt/', 'We need to protect the environment.', 'Chúng ta cần bảo vệ môi trường.'),
    ('sustainable', 'bền vững', 'adjective', '/səˈsteɪnəbl/', 'Solar power is a sustainable energy source.', 'Năng lượng mặt trời là nguồn năng lượng bền vững.'),
    ('pollution', 'sự ô nhiễm', 'noun', '/pəˈluːʃn/', 'Air pollution is a serious problem in big cities.', 'Ô nhiễm không khí là vấn đề nghiêm trọng ở các thành phố lớn.'),
    ('emission', 'sự phát thải', 'noun', '/ɪˈmɪʃn/', 'The factory reduced its carbon emissions.', 'Nhà máy đã giảm lượng khí thải carbon.'),
    ('deforestation', 'nạn phá rừng', 'noun', '/diːˌfɒrɪˈsteɪʃn/', 'Deforestation destroys natural habitats.', 'Nạn phá rừng phá hủy môi trường sống tự nhiên.'),
    ('renewable', 'có thể tái tạo', 'adjective', '/rɪˈnjuːəbl/', 'Wind is a renewable resource.', 'Gió là một nguồn tài nguyên có thể tái tạo.'),
    ('ecosystem', 'hệ sinh thái', 'noun', '/ˈiːkəʊsɪstəm/', 'Coral reefs support a diverse ecosystem.', 'Rạn san hô nuôi dưỡng một hệ sinh thái đa dạng.'),
    ('greenhouse gas', 'khí nhà kính', 'noun', '/ˈɡriːnhaʊs ɡæs/', 'Carbon dioxide is a major greenhouse gas.', 'Carbon dioxide là một loại khí nhà kính chính.'),
    ('conservation', 'sự bảo tồn', 'noun', '/ˌkɒnsəˈveɪʃn/', 'Wildlife conservation is vital for biodiversity.', 'Bảo tồn động vật hoang dã rất quan trọng cho đa dạng sinh học.'),
    ('biodiversity', 'đa dạng sinh học', 'noun', '/ˌbaɪəʊdaɪˈvɜːsəti/', 'The rainforest has incredible biodiversity.', 'Rừng nhiệt đới có sự đa dạng sinh học đáng kinh ngạc.'),
    ('drought', 'hạn hán', 'noun', '/draʊt/', 'The region suffered a severe drought last year.', 'Khu vực này đã trải qua một đợt hạn hán nghiêm trọng năm ngoái.'),
    ('global warming', 'sự nóng lên toàn cầu', 'noun', '/ˌɡləʊbl ˈwɔːmɪŋ/', 'Global warming causes ice caps to melt.', 'Sự nóng lên toàn cầu khiến các chỏm băng tan chảy.'),
    ('recycle', 'tái chế', 'verb', '/riːˈsaɪkl/', 'We should recycle plastic bottles.', 'Chúng ta nên tái chế chai nhựa.'),
    ('landfill', 'bãi rác', 'noun', '/ˈlændfɪl/', 'Most household waste ends up in a landfill.', 'Hầu hết rác thải sinh hoạt cuối cùng đều ở bãi rác.'),
    ('endangered species', 'loài có nguy cơ tuyệt chủng', 'noun', '/ɪnˈdeɪndʒəd ˈspiːʃiːz/', 'Pandas are an endangered species.', 'Gấu trúc là loài có nguy cơ tuyệt chủng.'),
    ('carbon footprint', 'dấu chân carbon', 'noun', '/ˈkɑːbən ˈfʊtprɪnt/', 'Flying often increases your carbon footprint.', 'Đi máy bay thường xuyên làm tăng dấu chân carbon của bạn.'),
    ('natural resource', 'tài nguyên thiên nhiên', 'noun', '/ˈnætʃrəl rɪˈsɔːs/', 'Oil is a finite natural resource.', 'Dầu mỏ là một tài nguyên thiên nhiên hữu hạn.'),
    ('overfishing', 'đánh bắt quá mức', 'noun', '/ˌəʊvəˈfɪʃɪŋ/', 'Overfishing has reduced fish populations.', 'Đánh bắt quá mức đã làm giảm số lượng cá.'),
    ('erosion', 'sự xói mòn', 'noun', '/ɪˈrəʊʒn/', 'Soil erosion affects agricultural land.', 'Xói mòn đất ảnh hưởng đến đất nông nghiệp.'),
    ('habitat', 'môi trường sống', 'noun', '/ˈhæbɪtæt/', 'Cutting down trees destroys animal habitats.', 'Chặt cây phá hủy môi trường sống của động vật.'),
    ('contamination', 'sự nhiễm bẩn', 'noun', '/kənˌtæmɪˈneɪʃn/', 'Water contamination can cause diseases.', 'Nhiễm bẩn nguồn nước có thể gây bệnh.'),
    ('sanction', 'biện pháp trừng phạt', 'noun', '/ˈsæŋkʃn/', 'The government imposed sanctions on polluting factories.', 'Chính phủ đã áp đặt các biện pháp trừng phạt đối với các nhà máy gây ô nhiễm.')
  ) as v(word, meaning, pos, pron, example, example_vi);

-- ---- IELTS Education ----
with new_set as (
  insert into public.vocabulary_sets (owner_id, title, description, difficulty, is_public, cover_color)
  select null, 'IELTS Education', 'Từ vựng IELTS chủ đề Giáo dục — hữu ích cho Writing và Speaking.', 'hard', true, 'violet'
  where not exists (select 1 from public.vocabulary_sets where title = 'IELTS Education')
  returning id
)
insert into public.vocabularies (set_id, word, meaning, part_of_speech, pronunciation, example, example_translation)
select id, v.word, v.meaning, v.pos, v.pron, v.example, v.example_vi from new_set, (values
    ('curriculum', 'chương trình học', 'noun', '/kəˈrɪkjələm/', 'The school updated its curriculum this year.', 'Trường đã cập nhật chương trình học năm nay.'),
    ('academic', 'thuộc học thuật', 'adjective', '/ˌækəˈdemɪk/', 'She has an impressive academic record.', 'Cô ấy có thành tích học thuật ấn tượng.'),
    ('literacy', 'khả năng đọc viết', 'noun', '/ˈlɪtərəsi/', 'Improving literacy rates is a national priority.', 'Cải thiện tỷ lệ biết đọc biết viết là ưu tiên quốc gia.'),
    ('scholarship', 'học bổng', 'noun', '/ˈskɒləʃɪp/', 'He received a full scholarship to study abroad.', 'Anh ấy nhận được học bổng toàn phần để du học.'),
    ('tuition', 'học phí', 'noun', '/tjuˈɪʃn/', 'University tuition has increased sharply.', 'Học phí đại học đã tăng mạnh.'),
    ('undergraduate', 'sinh viên đại học', 'noun', '/ˌʌndəˈɡrædʒuət/', 'She is an undergraduate at a top university.', 'Cô ấy là sinh viên đại học tại một trường hàng đầu.'),
    ('vocational', 'thuộc hướng nghiệp', 'adjective', '/vəʊˈkeɪʃənl/', 'Vocational training prepares students for specific jobs.', 'Đào tạo nghề chuẩn bị cho học sinh những công việc cụ thể.'),
    ('plagiarism', 'đạo văn', 'noun', '/ˈpleɪdʒərɪzəm/', 'Plagiarism is considered a serious offense.', 'Đạo văn được coi là một hành vi vi phạm nghiêm trọng.'),
    ('assessment', 'sự đánh giá', 'noun', '/əˈsesmənt/', 'Continuous assessment is used instead of one final exam.', 'Đánh giá liên tục được sử dụng thay vì một kỳ thi cuối cùng.'),
    ('extracurricular', 'ngoại khóa', 'adjective', '/ˌekstrəkəˈrɪkjələ(r)/', 'Extracurricular activities help students develop soft skills.', 'Hoạt động ngoại khóa giúp học sinh phát triển kỹ năng mềm.'),
    ('mentor', 'người cố vấn', 'noun', '/ˈmentɔː(r)/', 'Every new student is assigned a mentor.', 'Mỗi sinh viên mới đều được phân công một người cố vấn.'),
    ('enrollment', 'sự ghi danh', 'noun', '/ɪnˈrəʊlmənt/', 'School enrollment has increased this year.', 'Số học sinh ghi danh vào trường đã tăng năm nay.'),
    ('faculty', 'khoa (đại học)', 'noun', '/ˈfækəlti/', 'The faculty of medicine is highly competitive.', 'Khoa y có tính cạnh tranh cao.'),
    ('dropout', 'người bỏ học', 'noun', '/ˈdrɒpaʊt/', 'The dropout rate has decreased over the past decade.', 'Tỷ lệ bỏ học đã giảm trong thập kỷ qua.'),
    ('pedagogy', 'phương pháp sư phạm', 'noun', '/ˈpedəɡɒdʒi/', 'Modern pedagogy focuses on student-centered learning.', 'Phương pháp sư phạm hiện đại tập trung vào việc học lấy học sinh làm trung tâm.'),
    ('standardized test', 'bài kiểm tra chuẩn hóa', 'noun', '/ˈstændədaɪzd test/', 'Standardized tests are used for university admission.', 'Các bài kiểm tra chuẩn hóa được dùng để tuyển sinh đại học.'),
    ('rote learning', 'học vẹt', 'noun', '/rəʊt ˈlɜːnɪŋ/', 'Rote learning does not encourage critical thinking.', 'Học vẹt không khuyến khích tư duy phản biện.'),
    ('literacy rate', 'tỷ lệ biết chữ', 'noun', '/ˈlɪtərəsi reɪt/', 'The literacy rate has improved significantly.', 'Tỷ lệ biết chữ đã cải thiện đáng kể.'),
    ('comprehension', 'sự hiểu (bài đọc)', 'noun', '/ˌkɒmprɪˈhenʃn/', 'Reading comprehension is tested in the exam.', 'Kỹ năng đọc hiểu được kiểm tra trong kỳ thi.'),
    ('lifelong learning', 'học tập suốt đời', 'noun', '/ˈlaɪflɒŋ ˈlɜːnɪŋ/', 'Lifelong learning is essential in a changing job market.', 'Học tập suốt đời rất cần thiết trong thị trường việc làm thay đổi.'),
    ('boarding school', 'trường nội trú', 'noun', '/ˈbɔːdɪŋ skuːl/', 'He studied at a boarding school in the UK.', 'Anh ấy học tại một trường nội trú ở Anh.')
  ) as v(word, meaning, pos, pron, example, example_vi);

-- ---- Daily English ----
with new_set as (
  insert into public.vocabulary_sets (owner_id, title, description, difficulty, is_public, cover_color)
  select null, 'Daily English', 'Từ vựng tiếng Anh giao tiếp hàng ngày, thông dụng và dễ áp dụng.', 'easy', true, 'coral'
  where not exists (select 1 from public.vocabulary_sets where title = 'Daily English')
  returning id
)
insert into public.vocabularies (set_id, word, meaning, part_of_speech, pronunciation, example, example_translation)
select id, v.word, v.meaning, v.pos, v.pron, v.example, v.example_vi from new_set, (values
    ('errand', 'việc vặt', 'noun', '/ˈerənd/', 'I have to run some errands this afternoon.', 'Tôi phải đi làm vài việc vặt chiều nay.'),
    ('commute', 'đi lại (làm/học)', 'verb', '/kəˈmjuːt/', 'She commutes to work by bus every day.', 'Cô ấy đi làm bằng xe buýt mỗi ngày.'),
    ('chore', 'việc nhà', 'noun', '/tʃɔː(r)/', 'Doing the dishes is my least favorite chore.', 'Rửa bát là việc nhà tôi ghét nhất.'),
    ('leftover', 'đồ ăn thừa', 'noun', '/ˈleftəʊvə(r)/', 'We had leftovers for dinner.', 'Chúng tôi ăn đồ thừa cho bữa tối.'),
    ('groceries', 'hàng tạp hóa', 'noun', '/ˈɡrəʊsəriz/', 'I need to buy groceries after work.', 'Tôi cần mua đồ tạp hóa sau giờ làm.'),
    ('appointment', 'cuộc hẹn', 'noun', '/əˈpɔɪntmənt/', 'I have a dentist appointment tomorrow.', 'Tôi có hẹn khám nha sĩ vào ngày mai.'),
    ('exhausted', 'kiệt sức', 'adjective', '/ɪɡˈzɔːstɪd/', 'I''m exhausted after a long day at work.', 'Tôi kiệt sức sau một ngày dài làm việc.'),
    ('procrastinate', 'trì hoãn', 'verb', '/prəˈkræstɪneɪt/', 'I always procrastinate before deadlines.', 'Tôi luôn trì hoãn trước hạn chót.'),
    ('reschedule', 'sắp xếp lại lịch', 'verb', '/ˌriːˈʃedjuːl/', 'Can we reschedule our meeting to Friday?', 'Chúng ta có thể dời cuộc họp sang thứ Sáu không?'),
    ('babysit', 'trông trẻ', 'verb', '/ˈbeɪbisɪt/', 'She babysits her neighbor''s kids on weekends.', 'Cô ấy trông trẻ cho hàng xóm vào cuối tuần.'),
    ('run out of', 'hết (thứ gì đó)', 'phrasal verb', '/rʌn aʊt ɒv/', 'We ran out of milk this morning.', 'Chúng tôi hết sữa sáng nay.'),
    ('catch up', 'bắt kịp, gặp gỡ trò chuyện', 'phrasal verb', '/kætʃ ʌp/', 'Let''s catch up over coffee this weekend.', 'Cùng gặp nhau uống cà phê cuối tuần nhé.'),
    ('get along with', 'hòa hợp với', 'phrasal verb', '/ɡet əˈlɒŋ wɪð/', 'I get along with my coworkers really well.', 'Tôi hòa hợp rất tốt với đồng nghiệp.'),
    ('household', 'hộ gia đình', 'noun', '/ˈhaʊshəʊld/', 'Every household received a water bill.', 'Mỗi hộ gia đình đều nhận được hóa đơn nước.'),
    ('convenient', 'tiện lợi', 'adjective', '/kənˈviːniənt/', 'Online shopping is very convenient.', 'Mua sắm trực tuyến rất tiện lợi.'),
    ('neighborhood', 'khu phố', 'noun', '/ˈneɪbəhʊd/', 'We live in a quiet neighborhood.', 'Chúng tôi sống trong một khu phố yên tĩnh.'),
    ('routine', 'thói quen hàng ngày', 'noun', '/ruːˈtiːn/', 'Exercise is part of my morning routine.', 'Tập thể dục là một phần trong thói quen buổi sáng của tôi.'),
    ('afford', 'đủ khả năng (chi trả)', 'verb', '/əˈfɔːd/', 'We can''t afford a new car right now.', 'Chúng tôi không đủ khả năng mua xe mới lúc này.'),
    ('hang out', 'đi chơi', 'phrasal verb', '/hæŋ aʊt/', 'We usually hang out at the mall on Sundays.', 'Chúng tôi thường đi chơi ở trung tâm thương mại vào Chủ Nhật.'),
    ('worn out', 'mòn, kiệt sức', 'adjective', '/wɔːn aʊt/', 'My shoes are worn out.', 'Đôi giày của tôi đã mòn.')
  ) as v(word, meaning, pos, pron, example, example_vi);

-- ---- Technology ----
with new_set as (
  insert into public.vocabulary_sets (owner_id, title, description, difficulty, is_public, cover_color)
  select null, 'Technology', 'Từ vựng chủ đề Công nghệ, thiết bị và internet trong đời sống hiện đại.', 'medium', true, 'violet'
  where not exists (select 1 from public.vocabulary_sets where title = 'Technology')
  returning id
)
insert into public.vocabularies (set_id, word, meaning, part_of_speech, pronunciation, example, example_translation)
select id, v.word, v.meaning, v.pos, v.pron, v.example, v.example_vi from new_set, (values
    ('device', 'thiết bị', 'noun', '/dɪˈvaɪs/', 'This device can connect to Wi-Fi.', 'Thiết bị này có thể kết nối Wi-Fi.'),
    ('upload', 'tải lên', 'verb', '/ʌpˈləʊd/', 'I uploaded the photos to the cloud.', 'Tôi đã tải ảnh lên đám mây.'),
    ('download', 'tải xuống', 'verb', '/ˌdaʊnˈləʊd/', 'You can download the app for free.', 'Bạn có thể tải ứng dụng miễn phí.'),
    ('firmware', 'phần sụn', 'noun', '/ˈfɜːmweə(r)/', 'The company released a firmware update.', 'Công ty đã phát hành bản cập nhật phần sụn.'),
    ('bandwidth', 'băng thông', 'noun', '/ˈbændwɪdθ/', 'Video calls use a lot of bandwidth.', 'Cuộc gọi video sử dụng nhiều băng thông.'),
    ('encryption', 'mã hóa', 'noun', '/ɪnˈkrɪpʃn/', 'The app uses end-to-end encryption.', 'Ứng dụng sử dụng mã hóa đầu cuối.'),
    ('artificial intelligence', 'trí tuệ nhân tạo', 'noun', '/ˌɑːtɪfɪʃl ɪnˈtelɪdʒəns/', 'Artificial intelligence is changing many industries.', 'Trí tuệ nhân tạo đang thay đổi nhiều ngành công nghiệp.'),
    ('algorithm', 'thuật toán', 'noun', '/ˈælɡərɪðəm/', 'The recommendation algorithm learns your preferences.', 'Thuật toán đề xuất học sở thích của bạn.'),
    ('interface', 'giao diện', 'noun', '/ˈɪntəfeɪs/', 'The new interface is more user-friendly.', 'Giao diện mới thân thiện hơn với người dùng.'),
    ('malware', 'phần mềm độc hại', 'noun', '/ˈmælweə(r)/', 'The email contained malware.', 'Email đó chứa phần mềm độc hại.'),
    ('server', 'máy chủ', 'noun', '/ˈsɜːvə(r)/', 'The server crashed during peak hours.', 'Máy chủ bị sập vào giờ cao điểm.'),
    ('database', 'cơ sở dữ liệu', 'noun', '/ˈdeɪtəbeɪs/', 'All user data is stored in a database.', 'Tất cả dữ liệu người dùng được lưu trong cơ sở dữ liệu.'),
    ('wireless', 'không dây', 'adjective', '/ˈwaɪələs/', 'We installed a wireless router.', 'Chúng tôi đã lắp bộ định tuyến không dây.'),
    ('compatible', 'tương thích', 'adjective', '/kəmˈpætəbl/', 'This charger is compatible with most phones.', 'Bộ sạc này tương thích với hầu hết điện thoại.'),
    ('glitch', 'lỗi nhỏ, trục trặc', 'noun', '/ɡlɪtʃ/', 'There was a glitch in the software.', 'Có một trục trặc trong phần mềm.'),
    ('subscription', 'gói đăng ký', 'noun', '/səbˈskrɪpʃn/', 'I have a monthly subscription to this service.', 'Tôi có gói đăng ký hàng tháng cho dịch vụ này.'),
    ('virtual reality', 'thực tế ảo', 'noun', '/ˈvɜːtʃuəl riˈæləti/', 'Virtual reality is popular in gaming.', 'Thực tế ảo phổ biến trong ngành game.'),
    ('processor', 'bộ vi xử lý', 'noun', '/ˈprəʊsesə(r)/', 'The new phone has a faster processor.', 'Điện thoại mới có bộ vi xử lý nhanh hơn.'),
    ('backup', 'sao lưu', 'noun', '/ˈbækʌp/', 'Always keep a backup of important files.', 'Luôn giữ bản sao lưu của các tệp quan trọng.'),
    ('automation', 'sự tự động hóa', 'noun', '/ˌɔːtəˈmeɪʃn/', 'Automation has reduced manual labor.', 'Tự động hóa đã giảm bớt lao động chân tay.')
  ) as v(word, meaning, pos, pron, example, example_vi);

-- ---- THPT English ----
with new_set as (
  insert into public.vocabulary_sets (owner_id, title, description, difficulty, is_public, cover_color)
  select null, 'THPT English', 'Từ vựng ôn thi THPT Quốc gia — bám sát chương trình phổ thông.', 'easy', true, 'teal'
  where not exists (select 1 from public.vocabulary_sets where title = 'THPT English')
  returning id
)
insert into public.vocabularies (set_id, word, meaning, part_of_speech, pronunciation, example, example_translation)
select id, v.word, v.meaning, v.pos, v.pron, v.example, v.example_vi from new_set, (values
    ('achievement', 'thành tựu', 'noun', '/əˈtʃiːvmənt/', 'Winning the scholarship was a great achievement.', 'Giành được học bổng là một thành tựu lớn.'),
    ('significant', 'quan trọng, đáng kể', 'adjective', '/sɪɡˈnɪfɪkənt/', 'There was a significant increase in test scores.', 'Có sự gia tăng đáng kể trong điểm thi.'),
    ('opportunity', 'cơ hội', 'noun', '/ˌɒpəˈtjuːnəti/', 'Studying abroad is a great opportunity.', 'Du học là một cơ hội tuyệt vời.'),
    ('participate', 'tham gia', 'verb', '/pɑːˈtɪsɪpeɪt/', 'Students are encouraged to participate in clubs.', 'Học sinh được khuyến khích tham gia câu lạc bộ.'),
    ('responsible', 'có trách nhiệm', 'adjective', '/rɪˈspɒnsəbl/', 'He is responsible for organizing the event.', 'Anh ấy chịu trách nhiệm tổ chức sự kiện.'),
    ('communicate', 'giao tiếp', 'verb', '/kəˈmjuːnɪkeɪt/', 'It''s important to communicate clearly.', 'Giao tiếp rõ ràng rất quan trọng.'),
    ('environment', 'môi trường', 'noun', '/ɪnˈvaɪrənmənt/', 'We must take care of our environment.', 'Chúng ta phải chăm sóc môi trường của mình.'),
    ('tradition', 'truyền thống', 'noun', '/trəˈdɪʃn/', 'Tet is an important tradition in Vietnam.', 'Tết là một truyền thống quan trọng ở Việt Nam.'),
    ('competition', 'cuộc thi, sự cạnh tranh', 'noun', '/ˌkɒmpəˈtɪʃn/', 'She won first prize in the singing competition.', 'Cô ấy đoạt giải nhất trong cuộc thi hát.'),
    ('independent', 'độc lập', 'adjective', '/ˌɪndɪˈpendənt/', 'Vietnam became independent in 1945.', 'Việt Nam giành độc lập vào năm 1945.'),
    ('volunteer', 'tình nguyện viên', 'noun', '/ˌvɒlənˈtɪə(r)/', 'He works as a volunteer at the hospital.', 'Anh ấy làm tình nguyện viên tại bệnh viện.'),
    ('technology', 'công nghệ', 'noun', '/tekˈnɒlədʒi/', 'Technology has changed the way we learn.', 'Công nghệ đã thay đổi cách chúng ta học.'),
    ('healthy', 'khỏe mạnh, lành mạnh', 'adjective', '/ˈhelθi/', 'Eating vegetables keeps you healthy.', 'Ăn rau giúp bạn khỏe mạnh.'),
    ('relationship', 'mối quan hệ', 'noun', '/rɪˈleɪʃnʃɪp/', 'They have a close relationship.', 'Họ có mối quan hệ thân thiết.'),
    ('advantage', 'lợi thế', 'noun', '/ədˈvɑːntɪdʒ/', 'Speaking English gives you an advantage at work.', 'Nói tiếng Anh mang lại cho bạn lợi thế trong công việc.'),
    ('disadvantage', 'bất lợi', 'noun', '/ˌdɪsədˈvɑːntɪdʒ/', 'One disadvantage of city life is the noise.', 'Một bất lợi của cuộc sống thành phố là tiếng ồn.'),
    ('encourage', 'khuyến khích', 'verb', '/ɪnˈkʌrɪdʒ/', 'Teachers should encourage students to ask questions.', 'Giáo viên nên khuyến khích học sinh đặt câu hỏi.'),
    ('generation', 'thế hệ', 'noun', '/ˌdʒenəˈreɪʃn/', 'The younger generation uses social media a lot.', 'Thế hệ trẻ sử dụng mạng xã hội rất nhiều.'),
    ('solution', 'giải pháp', 'noun', '/səˈluːʃn/', 'We need to find a solution to this problem.', 'Chúng ta cần tìm giải pháp cho vấn đề này.'),
    ('develop', 'phát triển', 'verb', '/dɪˈveləp/', 'The government plans to develop rural areas.', 'Chính phủ có kế hoạch phát triển vùng nông thôn.')
  ) as v(word, meaning, pos, pron, example, example_vi);

-- ---- Travel & Tourism ----
with new_set as (
  insert into public.vocabulary_sets (owner_id, title, description, difficulty, is_public, cover_color)
  select null, 'Travel & Tourism', 'Từ vựng du lịch thiết yếu — giúp bạn tự tin khi đi du lịch nước ngoài.', 'easy', true, 'sky'
  where not exists (select 1 from public.vocabulary_sets where title = 'Travel & Tourism')
  returning id
)
insert into public.vocabularies (set_id, word, meaning, part_of_speech, pronunciation, example, example_translation)
select id, v.word, v.meaning, v.pos, v.pron, v.example, v.example_vi from new_set, (values
    ('luggage', 'hành lý', 'noun', '/ˈlʌɡɪdʒ/', 'Please put your luggage in the overhead compartment.', 'Vui lòng đặt hành lý của bạn vào ngăn trên đầu.'),
    ('boarding pass', 'thẻ lên máy bay', 'noun', '/ˈbɔːdɪŋ pɑːs/', 'Show your boarding pass at the gate.', 'Xuất trình thẻ lên máy bay tại cổng.'),
    ('itinerary', 'lịch trình', 'noun', '/aɪˈtɪnərəri/', 'Our itinerary includes three cities.', 'Lịch trình của chúng tôi bao gồm ba thành phố.'),
    ('accommodation', 'chỗ ở', 'noun', '/əˌkɒməˈdeɪʃn/', 'We need to book accommodation in advance.', 'Chúng ta cần đặt chỗ ở trước.'),
    ('destination', 'điểm đến', 'noun', '/ˌdestɪˈneɪʃn/', 'Paris is a popular tourist destination.', 'Paris là một điểm đến du lịch phổ biến.'),
    ('check in', 'làm thủ tục nhận phòng/lên máy bay', 'phrasal verb', '/tʃek ɪn/', 'We can check in online 24 hours before the flight.', 'Chúng ta có thể làm thủ tục trực tuyến 24 giờ trước chuyến bay.'),
    ('check out', 'trả phòng', 'phrasal verb', '/tʃek aʊt/', 'Check out time is 11 AM.', 'Giờ trả phòng là 11 giờ sáng.'),
    ('layover', 'thời gian quá cảnh', 'noun', '/ˈleɪəʊvə(r)/', 'We have a two-hour layover in Dubai.', 'Chúng tôi có hai giờ quá cảnh ở Dubai.'),
    ('souvenir', 'quà lưu niệm', 'noun', '/ˌsuːvəˈnɪə(r)/', 'I bought some souvenirs for my family.', 'Tôi đã mua một số quà lưu niệm cho gia đình.'),
    ('customs', 'hải quan', 'noun', '/ˈkʌstəmz/', 'You must go through customs when you arrive.', 'Bạn phải đi qua hải quan khi đến nơi.'),
    ('exchange rate', 'tỷ giá', 'noun', '/ɪksˈtʃeɪndʒ reɪt/', 'The exchange rate is very favorable today.', 'Tỷ giá hôm nay rất thuận lợi.'),
    ('backpacker', 'khách du lịch ba lô', 'noun', '/ˈbækpækə(r)/', 'Many backpackers stay in hostels.', 'Nhiều khách du lịch ba lô ở nhà trọ.'),
    ('tour guide', 'hướng dẫn viên du lịch', 'noun', '/tʊə(r) ɡaɪd/', 'Our tour guide was very knowledgeable.', 'Hướng dẫn viên của chúng tôi rất am hiểu.'),
    ('jet lag', 'mệt mỏi do chênh lệch múi giờ', 'noun', '/ˈdʒet læɡ/', 'I always suffer from jet lag on long flights.', 'Tôi luôn bị mệt vì chênh lệch giờ trên các chuyến bay dài.'),
    ('departure', 'sự khởi hành', 'noun', '/dɪˈpɑːtʃə(r)/', 'The departure time is 6:30 PM.', 'Giờ khởi hành là 6:30 chiều.'),
    ('arrival', 'sự đến nơi', 'noun', '/əˈraɪvl/', 'The estimated arrival time is 10 AM.', 'Thời gian đến dự kiến là 10 giờ sáng.'),
    ('visa', 'thị thực', 'noun', '/ˈviːzə/', 'You need a visa to enter this country.', 'Bạn cần thị thực để nhập cảnh quốc gia này.'),
    ('landmark', 'địa danh', 'noun', '/ˈlændmɑːk/', 'The Eiffel Tower is a famous landmark.', 'Tháp Eiffel là một địa danh nổi tiếng.'),
    ('scenic', 'đẹp (phong cảnh)', 'adjective', '/ˈsiːnɪk/', 'We drove along a scenic coastal road.', 'Chúng tôi lái xe dọc theo con đường ven biển đẹp.'),
    ('excursion', 'chuyến tham quan ngắn', 'noun', '/ɪkˈskɜːʃn/', 'We took an excursion to the nearby island.', 'Chúng tôi đi tham quan đảo gần đó.')
  ) as v(word, meaning, pos, pron, example, example_vi);

-- ---- Business English ----
with new_set as (
  insert into public.vocabulary_sets (owner_id, title, description, difficulty, is_public, cover_color)
  select null, 'Business English', 'Từ vựng tiếng Anh thương mại cho môi trường công sở chuyên nghiệp.', 'medium', true, 'indigo'
  where not exists (select 1 from public.vocabulary_sets where title = 'Business English')
  returning id
)
insert into public.vocabularies (set_id, word, meaning, part_of_speech, pronunciation, example, example_translation)
select id, v.word, v.meaning, v.pos, v.pron, v.example, v.example_vi from new_set, (values
    ('revenue', 'doanh thu', 'noun', '/ˈrevənjuː/', 'The company''s revenue increased by 20%.', 'Doanh thu của công ty tăng 20%.'),
    ('merger', 'sáp nhập', 'noun', '/ˈmɜːdʒə(r)/', 'The merger between the two companies was successful.', 'Việc sáp nhập giữa hai công ty đã thành công.'),
    ('stakeholder', 'bên liên quan', 'noun', '/ˈsteɪkhəʊldə(r)/', 'We need to consider all stakeholders in this decision.', 'Chúng ta cần xem xét tất cả các bên liên quan trong quyết định này.'),
    ('negotiate', 'đàm phán', 'verb', '/nɪˈɡəʊʃieɪt/', 'They are negotiating the terms of the contract.', 'Họ đang đàm phán các điều khoản của hợp đồng.'),
    ('deadline', 'hạn chót', 'noun', '/ˈdedlaɪn/', 'The deadline for this project is next Friday.', 'Hạn chót cho dự án này là thứ Sáu tuần sau.'),
    ('agenda', 'chương trình nghị sự', 'noun', '/əˈdʒendə/', 'Let''s review the meeting agenda.', 'Hãy xem lại chương trình nghị sự cuộc họp.'),
    ('forecast', 'dự báo', 'noun/verb', '/ˈfɔːkɑːst/', 'The sales forecast looks positive.', 'Dự báo doanh số trông tích cực.'),
    ('quarter', 'quý (3 tháng)', 'noun', '/ˈkwɔːtə(r)/', 'Profits rose in the third quarter.', 'Lợi nhuận tăng trong quý ba.'),
    ('proposal', 'đề xuất', 'noun', '/prəˈpəʊzl/', 'We submitted a proposal to the client.', 'Chúng tôi đã gửi đề xuất cho khách hàng.'),
    ('benchmark', 'tiêu chuẩn so sánh', 'noun', '/ˈbentʃmɑːk/', 'This product sets the benchmark for quality.', 'Sản phẩm này đặt tiêu chuẩn cho chất lượng.'),
    ('turnover', 'doanh thu, tỷ lệ thay đổi nhân sự', 'noun', '/ˈtɜːnəʊvə(r)/', 'Employee turnover is high in this industry.', 'Tỷ lệ thay đổi nhân viên cao trong ngành này.'),
    ('liability', 'trách nhiệm pháp lý, nợ phải trả', 'noun', '/ˌlaɪəˈbɪləti/', 'The company has limited liability.', 'Công ty có trách nhiệm hữu hạn.'),
    ('asset', 'tài sản', 'noun', '/ˈæset/', 'Real estate is a valuable asset.', 'Bất động sản là tài sản có giá trị.'),
    ('budget', 'ngân sách', 'noun', '/ˈbʌdʒɪt/', 'We need to stay within the budget.', 'Chúng ta cần duy trì trong ngân sách.'),
    ('collaborate', 'hợp tác', 'verb', '/kəˈlæbəreɪt/', 'We collaborate with teams across different countries.', 'Chúng tôi hợp tác với các nhóm ở nhiều quốc gia khác nhau.'),
    ('outsource', 'thuê ngoài', 'verb', '/ˈaʊtsɔːs/', 'Many companies outsource their IT services.', 'Nhiều công ty thuê ngoài dịch vụ IT.'),
    ('inventory', 'hàng tồn kho', 'noun', '/ˈɪnvəntri/', 'We need to check the inventory levels.', 'Chúng ta cần kiểm tra mức hàng tồn kho.'),
    ('invoice', 'hóa đơn', 'noun', '/ˈɪnvɔɪs/', 'Please send me the invoice for payment.', 'Vui lòng gửi cho tôi hóa đơn để thanh toán.'),
    ('commission', 'hoa hồng', 'noun', '/kəˈmɪʃn/', 'Sales staff earn a commission on each sale.', 'Nhân viên bán hàng nhận hoa hồng cho mỗi giao dịch.'),
    ('executive', 'giám đốc điều hành', 'noun', '/ɪɡˈzekjətɪv/', 'The executive team made the final decision.', 'Nhóm giám đốc điều hành đã đưa ra quyết định cuối cùng.')
  ) as v(word, meaning, pos, pron, example, example_vi);

-- ---- Health & Fitness ----
with new_set as (
  insert into public.vocabulary_sets (owner_id, title, description, difficulty, is_public, cover_color)
  select null, 'Health & Fitness', 'Từ vựng về sức khỏe và thể dục — cho lối sống khỏe mạnh.', 'easy', true, 'emerald'
  where not exists (select 1 from public.vocabulary_sets where title = 'Health & Fitness')
  returning id
)
insert into public.vocabularies (set_id, word, meaning, part_of_speech, pronunciation, example, example_translation)
select id, v.word, v.meaning, v.pos, v.pron, v.example, v.example_vi from new_set, (values
    ('exercise', 'tập thể dục', 'verb/noun', '/ˈeksəsaɪz/', 'I exercise three times a week.', 'Tôi tập thể dục ba lần một tuần.'),
    ('nutrition', 'dinh dưỡng', 'noun', '/njuˈtrɪʃn/', 'Good nutrition is essential for health.', 'Dinh dưỡng tốt rất cần thiết cho sức khỏe.'),
    ('symptom', 'triệu chứng', 'noun', '/ˈsɪmptəm/', 'Fever is a common symptom of the flu.', 'Sốt là triệu chứng phổ biến của cúm.'),
    ('diagnosis', 'chẩn đoán', 'noun', '/ˌdaɪəɡˈnəʊsɪs/', 'The doctor made an accurate diagnosis.', 'Bác sĩ đã đưa ra chẩn đoán chính xác.'),
    ('prescription', 'đơn thuốc', 'noun', '/prɪˈskrɪpʃn/', 'You need a prescription to buy this medicine.', 'Bạn cần đơn thuốc để mua loại thuốc này.'),
    ('immune system', 'hệ miễn dịch', 'noun', '/ɪˈmjuːn ˈsɪstəm/', 'Vitamin C strengthens the immune system.', 'Vitamin C tăng cường hệ miễn dịch.'),
    ('cardio', 'thể dục tim mạch', 'noun', '/ˈkɑːdiəʊ/', 'Running is good cardio exercise.', 'Chạy bộ là bài tập tim mạch tốt.'),
    ('calories', 'calo', 'noun', '/ˈkæləriz/', 'This meal contains 500 calories.', 'Bữa ăn này chứa 500 calo.'),
    ('protein', 'protein', 'noun', '/ˈprəʊtiːn/', 'Eggs are a good source of protein.', 'Trứng là nguồn protein tốt.'),
    ('yoga', 'yoga', 'noun', '/ˈjəʊɡə/', 'Yoga helps reduce stress.', 'Yoga giúp giảm căng thẳng.'),
    ('meditation', 'thiền', 'noun', '/ˌmedɪˈteɪʃn/', 'Daily meditation improves mental health.', 'Thiền hàng ngày cải thiện sức khỏe tâm thần.'),
    ('allergy', 'dị ứng', 'noun', '/ˈælədʒi/', 'She has an allergy to peanuts.', 'Cô ấy bị dị ứng với đậu phộng.'),
    ('injury', 'chấn thương', 'noun', '/ˈɪndʒəri/', 'He suffered a knee injury while playing football.', 'Anh ấy bị chấn thương đầu gối khi chơi bóng đá.'),
    ('recovery', 'sự hồi phục', 'noun', '/rɪˈkʌvəri/', 'Recovery from surgery takes time.', 'Hồi phục sau phẫu thuật mất thời gian.'),
    ('checkup', 'khám sức khỏe định kỳ', 'noun', '/ˈtʃekʌp/', 'I have a medical checkup next week.', 'Tôi có lịch khám sức khỏe tuần sau.'),
    ('hydration', 'sự cung cấp nước', 'noun', '/haɪˈdreɪʃn/', 'Proper hydration is important during exercise.', 'Cung cấp nước đúng cách quan trọng khi tập luyện.'),
    ('metabolism', 'trao đổi chất', 'noun', '/məˈtæbəlɪzəm/', 'Exercise can boost your metabolism.', 'Tập thể dục có thể tăng cường trao đổi chất.'),
    ('muscle', 'cơ bắp', 'noun', '/ˈmʌsl/', 'Weight training builds muscle.', 'Tập tạ xây dựng cơ bắp.'),
    ('vaccine', 'vắc-xin', 'noun', '/ˈvæksiːn/', 'The vaccine prevents the disease.', 'Vắc-xin ngăn ngừa bệnh.'),
    ('wellness', 'sự khỏe mạnh toàn diện', 'noun', '/ˈwelnəs/', 'The company promotes employee wellness.', 'Công ty thúc đẩy sức khỏe của nhân viên.')
  ) as v(word, meaning, pos, pron, example, example_vi);

-- ---- Food & Cooking ----
with new_set as (
  insert into public.vocabulary_sets (owner_id, title, description, difficulty, is_public, cover_color)
  select null, 'Food & Cooking', 'Từ vựng về ẩm thực và nấu nướng — cho người yêu thích bếp núc.', 'easy', true, 'amber'
  where not exists (select 1 from public.vocabulary_sets where title = 'Food & Cooking')
  returning id
)
insert into public.vocabularies (set_id, word, meaning, part_of_speech, pronunciation, example, example_translation)
select id, v.word, v.meaning, v.pos, v.pron, v.example, v.example_vi from new_set, (values
    ('ingredient', 'nguyên liệu', 'noun', '/ɪnˈɡriːdiənt/', 'Make sure you have all the ingredients before cooking.', 'Hãy chắc chắn bạn có tất cả nguyên liệu trước khi nấu.'),
    ('recipe', 'công thức nấu ăn', 'noun', '/ˈresəpi/', 'This is my grandmother''s recipe for pho.', 'Đây là công thức nấu phở của bà tôi.'),
    ('appetizer', 'món khai vị', 'noun', '/ˈæpɪtaɪzə(r)/', 'We ordered spring rolls as an appetizer.', 'Chúng tôi gọi chả giò làm món khai vị.'),
    ('marinate', 'ướp', 'verb', '/ˈmærɪneɪt/', 'Marinate the chicken for two hours.', 'Ướp gà trong hai giờ.'),
    ('simmer', 'om nhỏ lửa', 'verb', '/ˈsɪmə(r)/', 'Let the soup simmer for 30 minutes.', 'Để súp om nhỏ lửa trong 30 phút.'),
    ('garnish', 'trang trí (món ăn)', 'verb/noun', '/ˈɡɑːnɪʃ/', 'Garnish the dish with fresh herbs.', 'Trang trí món ăn bằng rau thơm tươi.'),
    ('seasoning', 'gia vị', 'noun', '/ˈsiːzənɪŋ/', 'Add seasoning to taste.', 'Thêm gia vị theo khẩu vị.'),
    ('utensil', 'dụng cụ nhà bếp', 'noun', '/juːˈtensl/', 'We need clean utensils for cooking.', 'Chúng ta cần dụng cụ sạch để nấu ăn.'),
    ('cuisine', 'ẩm thực', 'noun', '/kwɪˈziːn/', 'Vietnamese cuisine is known worldwide.', 'Ẩm thực Việt Nam được biết đến trên toàn thế giới.'),
    ('delicious', 'ngon', 'adjective', '/dɪˈlɪʃəs/', 'This cake is absolutely delicious!', 'Chiếc bánh này thực sự ngon!'),
    ('tender', 'mềm (thịt)', 'adjective', '/ˈtendə(r)/', 'The meat is very tender.', 'Thịt rất mềm.'),
    ('spicy', 'cay', 'adjective', '/ˈspaɪsi/', 'Thai food is usually spicy.', 'Đồ ăn Thái thường cay.'),
    ('bland', 'nhạt nhẽo', 'adjective', '/blænd/', 'This soup tastes bland without salt.', 'Súp này vị nhạt nhẽo không có muối.'),
    ('savory', 'mặn (không ngọt)', 'adjective', '/ˈseɪvəri/', 'I prefer savory snacks to sweet ones.', 'Tôi thích đồ ăn vặt mặn hơn đồ ngọt.'),
    ('grill', 'nướng', 'verb', '/ɡrɪl/', 'Grill the steak for 5 minutes on each side.', 'Nướng bít tết 5 phút mỗi mặt.'),
    ('boil', 'luộc, đun sôi', 'verb', '/bɔɪl/', 'Boil water before adding pasta.', 'Đun sôi nước trước khi cho mì ống vào.'),
    ('slice', 'thái lát', 'verb', '/slaɪs/', 'Slice the onions thinly.', 'Thái hành tây thành lát mỏng.'),
    ('chop', 'băm', 'verb', '/tʃɒp/', 'Chop the vegetables into small pieces.', 'Băm rau thành miếng nhỏ.'),
    ('portion', 'khẩu phần', 'noun', '/ˈpɔːʃn/', 'The portion size was very generous.', 'Khẩu phần rất lớn.'),
    ('leftovers', 'thức ăn thừa', 'noun', '/ˈleftəʊvəz/', 'We can have the leftovers for lunch tomorrow.', 'Chúng ta có thể ăn thức ăn thừa cho bữa trưa mai.')
  ) as v(word, meaning, pos, pron, example, example_vi);

-- ---- IELTS Society & Culture ----
with new_set as (
  insert into public.vocabulary_sets (owner_id, title, description, difficulty, is_public, cover_color)
  select null, 'IELTS Society & Culture', 'Từ vựng IELTS chủ đề Xã hội và Văn hóa — quan trọng cho Writing Task 2.', 'hard', true, 'rose'
  where not exists (select 1 from public.vocabulary_sets where title = 'IELTS Society & Culture')
  returning id
)
insert into public.vocabularies (set_id, word, meaning, part_of_speech, pronunciation, example, example_translation)
select id, v.word, v.meaning, v.pos, v.pron, v.example, v.example_vi from new_set, (values
    ('diversity', 'sự đa dạng', 'noun', '/daɪˈvɜːsəti/', 'Cultural diversity enriches society.', 'Đa dạng văn hóa làm giàu xã hội.'),
    ('discrimination', 'phân biệt đối xử', 'noun', '/dɪˌskrɪmɪˈneɪʃn/', 'Discrimination based on race is illegal.', 'Phân biệt đối xử dựa trên chủng tộc là bất hợp pháp.'),
    ('inequality', 'bất bình đẳng', 'noun', '/ˌɪnɪˈkwɒləti/', 'Income inequality is a serious problem.', 'Bất bình đẳng thu nhập là vấn đề nghiêm trọng.'),
    ('heritage', 'di sản', 'noun', '/ˈherɪtɪdʒ/', 'We must preserve our cultural heritage.', 'Chúng ta phải bảo tồn di sản văn hóa.'),
    ('integration', 'hội nhập', 'noun', '/ˌɪntɪˈɡreɪʃn/', 'Social integration helps immigrants adapt.', 'Hội nhập xã hội giúp người nhập cư thích nghi.'),
    ('stereotype', 'định kiến', 'noun', '/ˈsteriətaɪp/', 'We should challenge cultural stereotypes.', 'Chúng ta nên thách thức các định kiến văn hóa.'),
    ('urbanization', 'đô thị hóa', 'noun', '/ˌɜːbənaɪˈzeɪʃn/', 'Rapid urbanization creates housing shortages.', 'Đô thị hóa nhanh tạo ra tình trạng thiếu nhà ở.'),
    ('migration', 'di cư', 'noun', '/maɪˈɡreɪʃn/', 'Climate change causes mass migration.', 'Biến đổi khí hậu gây ra di cư hàng loạt.'),
    ('globalization', 'toàn cầu hóa', 'noun', '/ˌɡləʊbəlaɪˈzeɪʃn/', 'Globalization connects cultures worldwide.', 'Toàn cầu hóa kết nối các nền văn hóa trên toàn thế giới.'),
    ('multiculturalism', 'đa văn hóa', 'noun', '/ˌmʌltiˈkʌltʃərəlɪzəm/', 'Canada embraces multiculturalism.', 'Canada chào đón chủ nghĩa đa văn hóa.'),
    ('assimilation', 'đồng hóa', 'noun', '/əˌsɪməˈleɪʃn/', 'Cultural assimilation can be challenging.', 'Đồng hóa văn hóa có thể khó khăn.'),
    ('norm', 'chuẩn mực', 'noun', '/nɔːm/', 'Social norms vary across cultures.', 'Chuẩn mực xã hội khác nhau giữa các nền văn hóa.'),
    ('values', 'giá trị', 'noun', '/ˈvæljuːz/', 'Family values are important in many cultures.', 'Giá trị gia đình quan trọng trong nhiều nền văn hóa.'),
    ('prejudice', 'định kiến, thành kiến', 'noun', '/ˈpredʒudɪs/', 'Education can reduce prejudice.', 'Giáo dục có thể giảm thành kiến.'),
    ('tolerance', 'sự khoan dung', 'noun', '/ˈtɒlərəns/', 'We need more tolerance in society.', 'Chúng ta cần nhiều khoan dung hơn trong xã hội.'),
    ('cohesion', 'sự gắn kết', 'noun', '/kəʊˈhiːʒn/', 'Social cohesion strengthens communities.', 'Gắn kết xã hội củng cố cộng đồng.'),
    ('marginalization', 'sự gạt ra lề', 'noun', '/ˌmɑːdʒɪnəlaɪˈzeɪʃn/', 'Marginalization affects minority groups.', 'Gạt ra lề ảnh hưởng đến các nhóm thiểu số.'),
    ('empowerment', 'trao quyền', 'noun', '/ɪmˈpaʊəmənt/', 'Women''s empowerment is crucial for development.', 'Trao quyền cho phụ nữ rất quan trọng cho sự phát triển.'),
    ('hierarchy', 'thứ bậc', 'noun', '/ˈhaɪərɑːki/', 'Some cultures have strong social hierarchies.', 'Một số nền văn hóa có thứ bậc xã hội mạnh.'),
    ('demographic', 'nhân khẩu học', 'adjective/noun', '/ˌdeməˈɡræfɪk/', 'Demographic changes affect policy making.', 'Thay đổi nhân khẩu học ảnh hưởng đến việc hoạch định chính sách.')
  ) as v(word, meaning, pos, pron, example, example_vi);

-- ---- Phrasal Verbs ----
with new_set as (
  insert into public.vocabulary_sets (owner_id, title, description, difficulty, is_public, cover_color)
  select null, 'Phrasal Verbs', 'Phrasal verbs phổ biến trong tiếng Anh giao tiếp — cần thiết để nghe hiểu tự nhiên.', 'medium', true, 'cyan'
  where not exists (select 1 from public.vocabulary_sets where title = 'Phrasal Verbs')
  returning id
)
insert into public.vocabularies (set_id, word, meaning, part_of_speech, pronunciation, example, example_translation)
select id, v.word, v.meaning, v.pos, v.pron, v.example, v.example_vi from new_set, (values
    ('give up', 'từ bỏ', 'phrasal verb', '/ɡɪv ʌp/', 'Don''t give up on your dreams.', 'Đừng từ bỏ ước mơ của bạn.'),
    ('look after', 'chăm sóc', 'phrasal verb', '/lʊk ˈɑːftə(r)/', 'She looks after her elderly parents.', 'Cô ấy chăm sóc cha mẹ già.'),
    ('put off', 'trì hoãn', 'phrasal verb', '/pʊt ɒf/', 'We had to put off the meeting until next week.', 'Chúng tôi phải trì hoãn cuộc họp đến tuần sau.'),
    ('take off', 'cất cánh; cởi (quần áo)', 'phrasal verb', '/teɪk ɒf/', 'The plane will take off in 10 minutes.', 'Máy bay sẽ cất cánh trong 10 phút nữa.'),
    ('turn down', 'từ chối; vặn nhỏ', 'phrasal verb', '/tɜːn daʊn/', 'He turned down the job offer.', 'Anh ấy từ chối lời mời làm việc.'),
    ('break down', 'hỏng; suy sụp', 'phrasal verb', '/breɪk daʊn/', 'My car broke down on the highway.', 'Xe tôi hỏng trên đường cao tốc.'),
    ('bring up', 'nuôi dưỡng; đề cập', 'phrasal verb', '/brɪŋ ʌp/', 'She was brought up in the countryside.', 'Cô ấy được nuôi dưỡng ở nông thôn.'),
    ('carry on', 'tiếp tục', 'phrasal verb', '/ˈkæri ɒn/', 'Please carry on with your work.', 'Xin hãy tiếp tục công việc của bạn.'),
    ('come across', 'tình cờ gặp', 'phrasal verb', '/kʌm əˈkrɒs/', 'I came across an old friend at the mall.', 'Tôi tình cờ gặp một người bạn cũ ở trung tâm thương mại.'),
    ('figure out', 'tìm ra, hiểu', 'phrasal verb', '/ˈfɪɡə(r) aʊt/', 'I can''t figure out how to solve this problem.', 'Tôi không thể tìm ra cách giải quyết vấn đề này.'),
    ('get over', 'vượt qua, khỏi (bệnh)', 'phrasal verb', '/ɡet ˈəʊvə(r)/', 'It took her a long time to get over the loss.', 'Cô ấy mất nhiều thời gian để vượt qua mất mát.'),
    ('hold on', 'chờ đợi; giữ chặt', 'phrasal verb', '/həʊld ɒn/', 'Hold on a second, I''ll be right back.', 'Đợi một chút, tôi sẽ quay lại ngay.'),
    ('look forward to', 'mong đợi', 'phrasal verb', '/lʊk ˈfɔːwəd tuː/', 'I look forward to hearing from you.', 'Tôi mong được nghe tin từ bạn.'),
    ('make up', 'trang điểm; bịa chuyện; làm hòa', 'phrasal verb', '/meɪk ʌp/', 'They had a fight but made up later.', 'Họ cãi nhau nhưng đã làm hòa sau đó.'),
    ('set up', 'thành lập, thiết lập', 'phrasal verb', '/set ʌp/', 'They set up a new company last year.', 'Họ thành lập một công ty mới năm ngoái.'),
    ('show up', 'xuất hiện', 'phrasal verb', '/ʃəʊ ʌp/', 'He didn''t show up at the party.', 'Anh ấy không xuất hiện tại bữa tiệc.'),
    ('take care of', 'chăm sóc', 'phrasal verb', '/teɪk keə(r) ɒv/', 'I need to take care of some errands.', 'Tôi cần giải quyết một số việc vặt.'),
    ('work out', 'tập thể dục; giải quyết', 'phrasal verb', '/wɜːk aʊt/', 'I work out at the gym every morning.', 'Tôi tập thể dục tại phòng gym mỗi sáng.'),
    ('go through', 'trải qua; xem xét', 'phrasal verb', '/ɡəʊ θruː/', 'She went through a difficult time last year.', 'Cô ấy đã trải qua thời gian khó khăn năm ngoái.'),
    ('run into', 'tình cờ gặp', 'phrasal verb', '/rʌn ˈɪntuː/', 'I ran into my teacher at the supermarket.', 'Tôi tình cờ gặp giáo viên của mình ở siêu thị.')
  ) as v(word, meaning, pos, pron, example, example_vi);

-- ---- Entertainment & Media ----
with new_set as (
  insert into public.vocabulary_sets (owner_id, title, description, difficulty, is_public, cover_color)
  select null, 'Entertainment & Media', 'Từ vựng về giải trí và truyền thông — phim, nhạc, mạng xã hội.', 'medium', true, 'fuchsia'
  where not exists (select 1 from public.vocabulary_sets where title = 'Entertainment & Media')
  returning id
)
insert into public.vocabularies (set_id, word, meaning, part_of_speech, pronunciation, example, example_translation)
select id, v.word, v.meaning, v.pos, v.pron, v.example, v.example_vi from new_set, (values
    ('premiere', 'buổi công chiếu', 'noun', '/ˈpremieə(r)/', 'The movie premiere was attended by many celebrities.', 'Buổi công chiếu phim có nhiều người nổi tiếng tham dự.'),
    ('sequel', 'phần tiếp theo', 'noun', '/ˈsiːkwəl/', 'The sequel was even better than the original.', 'Phần tiếp theo hay hơn cả phần gốc.'),
    ('soundtrack', 'nhạc phim', 'noun', '/ˈsaʊndtræk/', 'The soundtrack of this movie is amazing.', 'Nhạc phim của bộ phim này tuyệt vời.'),
    ('streaming', 'phát trực tuyến', 'noun', '/ˈstriːmɪŋ/', 'Streaming services are very popular now.', 'Các dịch vụ phát trực tuyến rất phổ biến hiện nay.'),
    ('broadcast', 'phát sóng', 'verb/noun', '/ˈbrɔːdkɑːst/', 'The show will be broadcast live tonight.', 'Chương trình sẽ được phát sóng trực tiếp tối nay.'),
    ('viral', 'lan truyền (trên mạng)', 'adjective', '/ˈvaɪrəl/', 'The video went viral on social media.', 'Video đã lan truyền trên mạng xã hội.'),
    ('podcast', 'podcast', 'noun', '/ˈpɒdkɑːst/', 'I listen to podcasts during my commute.', 'Tôi nghe podcast khi đi làm.'),
    ('binge-watch', 'xem nhiều tập liên tục', 'verb', '/bɪndʒ wɒtʃ/', 'I binge-watched the entire series last weekend.', 'Tôi xem hết cả series cuối tuần trước.'),
    ('spoiler', 'tiết lộ cốt truyện', 'noun', '/ˈspɔɪlə(r)/', 'Don''t give me any spoilers about the ending!', 'Đừng tiết lộ cho tôi về cái kết!'),
    ('genre', 'thể loại', 'noun', '/ˈʒɒnrə/', 'What genre of music do you like?', 'Bạn thích thể loại nhạc gì?'),
    ('blockbuster', 'phim bom tấn', 'noun', '/ˈblɒkbʌstə(r)/', 'It was the biggest blockbuster of the summer.', 'Đó là bom tấn lớn nhất mùa hè.'),
    ('celebrity', 'người nổi tiếng', 'noun', '/səˈlebrəti/', 'Many celebrities attended the awards ceremony.', 'Nhiều người nổi tiếng tham dự lễ trao giải.'),
    ('influencer', 'người có ảnh hưởng (mạng xã hội)', 'noun', '/ˈɪnfluənsə(r)/', 'She is a famous influencer on Instagram.', 'Cô ấy là một influencer nổi tiếng trên Instagram.'),
    ('subscription', 'gói đăng ký', 'noun', '/səbˈskrɪpʃn/', 'I have a subscription to Netflix.', 'Tôi có gói đăng ký Netflix.'),
    ('trending', 'đang thịnh hành', 'adjective', '/ˈtrendɪŋ/', 'This song is trending on TikTok.', 'Bài hát này đang thịnh hành trên TikTok.'),
    ('comedy', 'hài kịch', 'noun', '/ˈkɒmədi/', 'I love watching comedy shows.', 'Tôi thích xem các chương trình hài.'),
    ('documentary', 'phim tài liệu', 'noun', '/ˌdɒkjuˈmentri/', 'The documentary about wildlife was fascinating.', 'Phim tài liệu về động vật hoang dã rất hấp dẫn.'),
    ('episode', 'tập (phim)', 'noun', '/ˈepɪsəʊd/', 'The next episode will air next week.', 'Tập tiếp theo sẽ phát sóng tuần sau.'),
    ('audience', 'khán giả', 'noun', '/ˈɔːdiəns/', 'The audience applauded loudly.', 'Khán giả vỗ tay rất to.'),
    ('review', 'đánh giá', 'noun/verb', '/rɪˈvjuː/', 'The movie received excellent reviews.', 'Bộ phim nhận được đánh giá xuất sắc.')
  ) as v(word, meaning, pos, pron, example, example_vi);

-- ---- Weather & Nature ----
with new_set as (
  insert into public.vocabulary_sets (owner_id, title, description, difficulty, is_public, cover_color)
  select null, 'Weather & Nature', 'Từ vựng về thời tiết và thiên nhiên — mô tả khí hậu và cảnh quan.', 'easy', true, 'lime'
  where not exists (select 1 from public.vocabulary_sets where title = 'Weather & Nature')
  returning id
)
insert into public.vocabularies (set_id, word, meaning, part_of_speech, pronunciation, example, example_translation)
select id, v.word, v.meaning, v.pos, v.pron, v.example, v.example_vi from new_set, (values
    ('drizzle', 'mưa phùn', 'noun/verb', '/ˈdrɪzl/', 'It''s drizzling outside.', 'Bên ngoài đang mưa phùn.'),
    ('breeze', 'gió nhẹ', 'noun', '/briːz/', 'There''s a nice breeze this evening.', 'Tối nay có gió nhẹ dễ chịu.'),
    ('thunder', 'sấm', 'noun', '/ˈθʌndə(r)/', 'I can hear thunder in the distance.', 'Tôi có thể nghe thấy tiếng sấm từ xa.'),
    ('lightning', 'chớp, sét', 'noun', '/ˈlaɪtnɪŋ/', 'Lightning struck the tree.', 'Sét đánh vào cây.'),
    ('foggy', 'có sương mù', 'adjective', '/ˈfɒɡi/', 'It''s very foggy this morning.', 'Sáng nay có sương mù dày.'),
    ('hurricane', 'bão lớn', 'noun', '/ˈhʌrɪkən/', 'A hurricane hit the coastal area.', 'Một cơn bão lớn đánh vào khu vực ven biển.'),
    ('frost', 'sương giá', 'noun', '/frɒst/', 'There was frost on the ground this morning.', 'Sáng nay có sương giá trên mặt đất.'),
    ('forecast', 'dự báo thời tiết', 'noun', '/ˈfɔːkɑːst/', 'The weather forecast says it will rain tomorrow.', 'Dự báo thời tiết nói mai sẽ mưa.'),
    ('temperature', 'nhiệt độ', 'noun', '/ˈtemprətʃə(r)/', 'The temperature dropped below zero.', 'Nhiệt độ giảm xuống dưới 0.'),
    ('humidity', 'độ ẩm', 'noun', '/hjuːˈmɪdəti/', 'The humidity is very high today.', 'Độ ẩm hôm nay rất cao.'),
    ('rainbow', 'cầu vồng', 'noun', '/ˈreɪnbəʊ/', 'We saw a beautiful rainbow after the rain.', 'Chúng tôi thấy cầu vồng đẹp sau cơn mưa.'),
    ('scenery', 'phong cảnh', 'noun', '/ˈsiːnəri/', 'The mountain scenery is breathtaking.', 'Phong cảnh núi non ngoạn mục.'),
    ('wilderness', 'vùng hoang dã', 'noun', '/ˈwɪldənəs/', 'They went camping in the wilderness.', 'Họ đi cắm trại ở vùng hoang dã.'),
    ('cliff', 'vách đá', 'noun', '/klɪf/', 'Be careful near the edge of the cliff.', 'Hãy cẩn thận gần mép vách đá.'),
    ('valley', 'thung lũng', 'noun', '/ˈvæli/', 'The village is located in a valley.', 'Ngôi làng nằm trong một thung lũng.'),
    ('peak', 'đỉnh (núi)', 'noun', '/piːk/', 'They reached the peak at sunrise.', 'Họ đến đỉnh lúc bình minh.'),
    ('stream', 'suối', 'noun', '/striːm/', 'A small stream runs through the forest.', 'Một con suối nhỏ chảy qua rừng.'),
    ('meadow', 'đồng cỏ', 'noun', '/ˈmedəʊ/', 'Wildflowers grow in the meadow.', 'Hoa dại mọc trên đồng cỏ.'),
    ('avalanche', 'tuyết lở', 'noun', '/ˈævəlɑːnʃ/', 'The avalanche blocked the road.', 'Tuyết lở đã chặn đường.'),
    ('tide', 'thủy triều', 'noun', '/taɪd/', 'The tide is coming in.', 'Thủy triều đang lên.')
  ) as v(word, meaning, pos, pron, example, example_vi);

-- ---- Academic Writing ----
with new_set as (
  insert into public.vocabulary_sets (owner_id, title, description, difficulty, is_public, cover_color)
  select null, 'Academic Writing', 'Từ vựng viết học thuật — cần thiết cho luận văn, báo cáo và IELTS Writing.', 'hard', true, 'purple'
  where not exists (select 1 from public.vocabulary_sets where title = 'Academic Writing')
  returning id
)
insert into public.vocabularies (set_id, word, meaning, part_of_speech, pronunciation, example, example_translation)
select id, v.word, v.meaning, v.pos, v.pron, v.example, v.example_vi from new_set, (values
    ('furthermore', 'hơn nữa', 'adverb', '/ˌfɜːðəˈmɔː(r)/', 'Furthermore, the research shows significant results.', 'Hơn nữa, nghiên cứu cho thấy kết quả đáng kể.'),
    ('nevertheless', 'tuy nhiên, dù vậy', 'adverb', '/ˌnevəðəˈles/', 'The study had limitations; nevertheless, it provides valuable insights.', 'Nghiên cứu có hạn chế; dù vậy, nó cung cấp những hiểu biết có giá trị.'),
    ('consequently', 'do đó, vì vậy', 'adverb', '/ˈkɒnsɪkwəntli/', 'The data was incomplete; consequently, the results are inconclusive.', 'Dữ liệu không đầy đủ; vì vậy, kết quả không có kết luận.'),
    ('hypothesis', 'giả thuyết', 'noun', '/haɪˈpɒθəsɪs/', 'The hypothesis was tested through experiments.', 'Giả thuyết đã được kiểm tra qua thí nghiệm.'),
    ('methodology', 'phương pháp luận', 'noun', '/ˌmeθəˈdɒlədʒi/', 'The methodology section explains the research approach.', 'Phần phương pháp luận giải thích cách tiếp cận nghiên cứu.'),
    ('empirical', 'thực nghiệm', 'adjective', '/ɪmˈpɪrɪkl/', 'The study is based on empirical evidence.', 'Nghiên cứu dựa trên bằng chứng thực nghiệm.'),
    ('paradigm', 'mô hình, khuôn mẫu', 'noun', '/ˈpærədaɪm/', 'The research represents a paradigm shift.', 'Nghiên cứu đại diện cho một sự thay đổi mô hình.'),
    ('correlation', 'mối tương quan', 'noun', '/ˌkɒrəˈleɪʃn/', 'There is a strong correlation between the two variables.', 'Có mối tương quan mạnh giữa hai biến số.'),
    ('aforementioned', 'đã đề cập ở trên', 'adjective', '/əˌfɔːˈmenʃənd/', 'The aforementioned study supports this conclusion.', 'Nghiên cứu đã đề cập ở trên ủng hộ kết luận này.'),
    ('subsequent', 'sau đó, tiếp theo', 'adjective', '/ˈsʌbsɪkwənt/', 'Subsequent research confirmed these findings.', 'Nghiên cứu sau đó đã xác nhận những phát hiện này.'),
    ('implication', 'hàm ý, hệ quả', 'noun', '/ˌɪmplɪˈkeɪʃn/', 'The findings have important implications for policy.', 'Những phát hiện có hệ quả quan trọng cho chính sách.'),
    ('criterion', 'tiêu chí', 'noun', '/kraɪˈtɪəriən/', 'The main criterion for selection was experience.', 'Tiêu chí chính để lựa chọn là kinh nghiệm.'),
    ('phenomenon', 'hiện tượng', 'noun', '/fəˈnɒmɪnən/', 'This phenomenon has been observed worldwide.', 'Hiện tượng này đã được quan sát trên toàn thế giới.'),
    ('substantial', 'đáng kể', 'adjective', '/səbˈstænʃl/', 'There has been substantial progress in this field.', 'Đã có tiến bộ đáng kể trong lĩnh vực này.'),
    ('demonstrate', 'chứng minh', 'verb', '/ˈdemənstreɪt/', 'The results demonstrate a clear pattern.', 'Kết quả chứng minh một mô hình rõ ràng.'),
    ('comprise', 'bao gồm', 'verb', '/kəmˈpraɪz/', 'The sample comprises 100 participants.', 'Mẫu bao gồm 100 người tham gia.'),
    ('evaluate', 'đánh giá', 'verb', '/ɪˈvæljueɪt/', 'We need to evaluate the effectiveness of the program.', 'Chúng ta cần đánh giá hiệu quả của chương trình.'),
    ('framework', 'khung (lý thuyết)', 'noun', '/ˈfreɪmwɜːk/', 'The theoretical framework guides the analysis.', 'Khung lý thuyết hướng dẫn phân tích.'),
    ('perspective', 'quan điểm, góc nhìn', 'noun', '/pəˈspektɪv/', 'From a global perspective, the issue is complex.', 'Từ góc nhìn toàn cầu, vấn đề rất phức tạp.'),
    ('underlying', 'cơ bản, tiềm ẩn', 'adjective', '/ˌʌndəˈlaɪɪŋ/', 'The underlying cause of the problem is unclear.', 'Nguyên nhân cơ bản của vấn đề không rõ ràng.')
  ) as v(word, meaning, pos, pron, example, example_vi);
