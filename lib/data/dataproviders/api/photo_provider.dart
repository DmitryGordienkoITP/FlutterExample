import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:test_task/data/models/photo_model.dart';

@singleton
class PhotoProvider {
  final _dio = Dio();

  final String _apiUrl = 'https://jsonplaceholder.typicode.com/photos';

  Future<List<PhotoModel>> getAll() async {
    final result = await _getMock();
    /*
    final response = await _dio.get(_apiUrl);
    final result = List<PhotoModel>.from(
      (response.data as List<dynamic>).map<PhotoModel>(
        (x) => PhotoModel.fromMap(x as Map<String, dynamic>),
      ),
    );*/
    return result.take(20).toList();
  }

  Future<List<PhotoModel>> _getMock() async {
    await Future.delayed(const Duration(seconds: 2));
    return List<PhotoModel>.from(_mock.map((e) => PhotoModel.fromJson(e)));
  }

  final List<String> _mock = [
    ''' 
    {
      "albumId": 1,
      "id": 1,
      "title": "accusamus beatae ad facilis cum similique qui sunt",
      "url": "https://upload.wikimedia.org/wikipedia/commons/thumb/5/51/Aaron_Paul_2012_2.jpg/800px-Aaron_Paul_2012_2.jpg",
      "thumbnailUrl": "https://upload.wikimedia.org/wikipedia/commons/thumb/5/51/Aaron_Paul_2012_2.jpg/266px-Aaron_Paul_2012_2.jpg"
    }''',
    '''{
      "albumId": 1,
      "id": 2,
      "title": "reprehenderit est deserunt velit ipsam",
      "url": "https://upload.wikimedia.org/wikipedia/commons/thumb/5/51/Aaron_Paul_2012_2.jpg/800px-Aaron_Paul_2012_2.jpg",
      "thumbnailUrl": "https://upload.wikimedia.org/wikipedia/commons/thumb/5/51/Aaron_Paul_2012_2.jpg/266px-Aaron_Paul_2012_2.jpg"
    }''',
    '''{
      "albumId": 1,
      "id": 3,
      "title": "officia porro iure quia iusto qui ipsa ut modi",
      "url": "https://upload.wikimedia.org/wikipedia/commons/thumb/5/51/Aaron_Paul_2012_2.jpg/800px-Aaron_Paul_2012_2.jpg",
      "thumbnailUrl": "https://upload.wikimedia.org/wikipedia/commons/thumb/5/51/Aaron_Paul_2012_2.jpg/266px-Aaron_Paul_2012_2.jpg"
    }''',
    '''{
      "albumId": 1,
      "id": 4,
      "title": "culpa odio esse rerum omnis laboriosam voluptate repudiandae",
      "url": "https://upload.wikimedia.org/wikipedia/commons/thumb/5/51/Aaron_Paul_2012_2.jpg/800px-Aaron_Paul_2012_2.jpg",
      "thumbnailUrl": "https://upload.wikimedia.org/wikipedia/commons/thumb/5/51/Aaron_Paul_2012_2.jpg/266px-Aaron_Paul_2012_2.jpg"
    }''',
    '''{
      "albumId": 1,
      "id": 5,
      "title": "natus nisi omnis corporis facere molestiae rerum in",
      "url": "https://upload.wikimedia.org/wikipedia/commons/thumb/5/51/Aaron_Paul_2012_2.jpg/800px-Aaron_Paul_2012_2.jpg",
      "thumbnailUrl": "https://upload.wikimedia.org/wikipedia/commons/thumb/5/51/Aaron_Paul_2012_2.jpg/266px-Aaron_Paul_2012_2.jpg"
    }''',
    '''{
      "albumId": 1,
      "id": 6,
      "title": "accusamus ea aliquid et amet sequi nemo",
      "url": "https://upload.wikimedia.org/wikipedia/commons/thumb/5/51/Aaron_Paul_2012_2.jpg/800px-Aaron_Paul_2012_2.jpg",
      "thumbnailUrl": "https://upload.wikimedia.org/wikipedia/commons/thumb/5/51/Aaron_Paul_2012_2.jpg/266px-Aaron_Paul_2012_2.jpg"
    }''',
    '''{
      "albumId": 1,
      "id": 7,
      "title": "officia delectus consequatur vero aut veniam explicabo molestias",
      "url": "https://upload.wikimedia.org/wikipedia/commons/thumb/5/51/Aaron_Paul_2012_2.jpg/800px-Aaron_Paul_2012_2.jpg",
      "thumbnailUrl": "https://upload.wikimedia.org/wikipedia/commons/thumb/5/51/Aaron_Paul_2012_2.jpg/266px-Aaron_Paul_2012_2.jpg"
    }''',
    '''{
      "albumId": 1,
      "id": 8,
      "title": "aut porro officiis laborum odit ea laudantium corporis",
      "url": "https://upload.wikimedia.org/wikipedia/commons/thumb/5/51/Aaron_Paul_2012_2.jpg/800px-Aaron_Paul_2012_2.jpg",
      "thumbnailUrl": "https://upload.wikimedia.org/wikipedia/commons/thumb/5/51/Aaron_Paul_2012_2.jpg/266px-Aaron_Paul_2012_2.jpg"
    }''',
    '''{
      "albumId": 1,
      "id": 9,
      "title": "qui eius qui autem sed",
      "url": "https://upload.wikimedia.org/wikipedia/commons/thumb/5/51/Aaron_Paul_2012_2.jpg/800px-Aaron_Paul_2012_2.jpg",
      "thumbnailUrl": "https://upload.wikimedia.org/wikipedia/commons/thumb/5/51/Aaron_Paul_2012_2.jpg/266px-Aaron_Paul_2012_2.jpg"
    }''',
    '''{
      "albumId": 1,
      "id": 10,
      "title": "beatae et provident et ut vel",
      "url": "https://upload.wikimedia.org/wikipedia/commons/thumb/5/51/Aaron_Paul_2012_2.jpg/800px-Aaron_Paul_2012_2.jpg",
      "thumbnailUrl": "https://upload.wikimedia.org/wikipedia/commons/thumb/5/51/Aaron_Paul_2012_2.jpg/266px-Aaron_Paul_2012_2.jpg"
    }''',
  ];
}
