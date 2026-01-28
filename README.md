## 프**론트엔드 개발자 포지션 사전 과제**

- 과제 기간: 2026.1.21 ~ 1.28

---

### 개발환경

**프레임워크 및 개발 도구**

- Flutter
- Android Studio

**기술 스택**

- Riverpod (State Management)
- Dio (HTTP Client)
- GoRouter (Navigation)
- Hive (Local Storage)
- Freezed (Immutable Model / State)

**아키텍처 및 패턴**

- Clean Architecture 기반
    - Domain / Data / Presentation 3계층 구조
- MVVM / Repository Pattern

---

### 빌드 및 실행하기

1. **의존성 설치**

```bash
flutter pub get
```

1. **코드 생성 (Freezed, JSON Serializable)**

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

1. **에뮬레이터 실행 (또는 실제 기기 연결)**
2. **앱 실행**

```bash
flutter run
```

---

### 코딩 컨벤션

- [코딩 컨벤션: wiki](https://github.com/wndnjs00/flutter_assignment/wiki/%ED%94%84%EB%A1%A0%ED%8A%B8%EC%97%94%EB%93%9C-%EA%B0%9C%EB%B0%9C%EC%9E%90-%ED%8F%AC%EC%A7%80%EC%85%98-%EC%82%AC%EC%A0%84-%EA%B3%BC%EC%A0%9C#1-%EC%BD%94%EB%93%9C-%EC%8A%A4%ED%83%80%EC%9D%BC)

### 이슈 & 커밋 리스트

- 고정 Issue 템플릿을 활용해 Issue 작성: [이슈 템플릿](https://github.com/wndnjs00/flutter_assignment/tree/dev/.github/ISSUE_TEMPLATE)
- [이슈 리스트](https://github.com/wndnjs00/flutter_assignment/issues?q=is%3Aissue%20state%3Aclosed)
- [커밋 리스트](https://github.com/wndnjs00/flutter_assignment/commits/dev/)

---

### 기능 요구사항

**필수 구현 사항**

- 사용자 회원가입
- 사용자 로그인
- 로그인한 사용자 정보 표시(아이디, 이름)
- 게시글 CRUD
- 게시글 목록 페이지네이션

**추가 구현 사항**

- 게시글 좋아요 기능
- 카테고리 기반 게시글 필터링
- 게시글 검색 기능
- 작성자 본인만 수정/삭제 가능하도록 구현
- 마이페이지
    - 로그인한 사용자가 좋아요한 게시글 목록 조회
    - 로그인한 사용자가 작성한 게시글 관리

---

### 구조설계하며 고민했던 사항들

[MVVM + Repository 패턴을 채택한 이유](https://www.notion.so/MVVM-Repository-2f65dca2121580beae41c20005ba182e?pvs=21)

[models 와 entities 를 분리한 이유](https://www.notion.so/models-entities-2f65dca2121580a693e1e6ba77c7be45?pvs=21)
