---
Chting ( 취미 + Meeting )
===
* * *
<br><br/>

[![Demo site](https://raw.githubusercontent.com/bestTeam1/ProjectChting/master/src/main/webapp/assets/img/demo_logo1.png)](http://team1.space/chting/)

<br><br/>
## 🔗 Link
- **Deploy Site :** http://team1.space/chting/
  

- **Github Repository :** https://github.com/bestTeam1/ProjectChting
  

- **Presentation (YouTube) :** https://www.youtube.com/watch?v=NOA5HjI43z0

<br><br/>
## 📖 Summary
> **Introduce Project**  
> - [💡 Motivation](#-motivation)  
> - [📌 Features](#-features)  
> - [🛠 Stack](#-stack)
> - [💿 Installation](#-installation)  
> - [📸 Site Screenshot](#-site-screenshot)
> - [🧑🏻‍💻 Team Member](#-team-member)

<br><br/>
* * *
~~~
~~~
Introduce Project
===
Chting은 비트캠프 1조의 파이널 프로젝트로  
2021.05.24 ~ 2021.07.01 총 38일간 설계 및 개발하였으며, 6명의 팀원이 함께 하였습니다.
<br><br/>
##💡 Motivation
팀원들과의 회의를 통해 취미활동을 할때 어려웠던 점, 아쉬웠던 점들을 개선한 사이트를 만들고자 했습니다.  

저희가 생각한 기존 취미활동의 문제점은 다음과 같습니다.

- 모임을 참여하려면 별도의 커뮤니티를 찾아야 한다
- 여러 모임에 가입하고 싶은 경우 각 커뮤니티 모두 가입해야한다는 번거로움이 있다
- 지인 등의 소개가 아니라면 일반적인 모임의 존재여부를 알기 힘들고 모임참여가 힘들다

위의 내용을 개선하여 사이트를 만들면 좋겠다는 생각에 Chting 프로젝트를 시작했습니다.
<br><br/>
##📌 Features
- Google, Kakao, Github 소셜 로그인
- 회원/비회원 전용 모임 추천
- 모임검색
- 모임생성 & 모임관리
- 모임게시판
- 모임일정관리
- 모임채팅
- 사이트 통계
- 사이트 이벤트 관리
<br><br/>
##🛠 Stack
###✔️ Front-End
- jQuery v.3.4.1
- Bootstrap v5.0.0 beta
- EL/JSTL
- Underscore JS v1.13.1
- FullCalendar v5.5.1
- Moment JS v2.11.0
- Chart JS v2.9.4

###✔️ Back-End
- Java v1.8
- Maven v3.6.3
- Spring framework v5.3.7
- Spring WebSocket v5.3.7
- Spring Transaction v5.3.7
- Spring Security v.5.3.10
- Spring Security OAuth2 Client v5.3.10
- Mybatis v3.5.6
- JackSon v2.12.3
- Lombok v1.18.20

###✔️ DataBase
- MariaDB v10.5.10

###✔️ Server
- Oracle Cloud Compute Instances (CentOS 7)
   - Instance-1 (Tomcat Server)
   - Instance-2 (DB Server)
- Apache Tomcat v9.0.43

###✔️ Open API
- Google Login API
- Kakao Login API
- Github Login API
- Kakao Map API
<br><br/>
##💿 Installation
> [info] **Working with Chting (this project) in your IDE**
### Steps:
#### ✔️ Prerequisites
아래의 항목들이 설치되어 있어야 합니다.
- Java 8 or newer
- Maven 3.6.3 or 3.6+ (http://maven.apache.org/install.html)
- git command line tool (https://help.github.com/articles/set-up-git)
- MariaDB 10.5+
- Tomcat 9.0.43 or 9+
- Your prefered IDE
    - Spring Tools Suite(STS)
    - IntelliJ IDEA
   
####1️⃣ 프로젝트 클론
~~~ 
git clone https://github.com/bestTeam1/ProjectChting.git
~~~
---
####2️⃣ _STS_ 에서  
   1. clone 한 프로젝트를 import  
      ```File -> Import -> Maven -> Existing Maven project```
   2. Maven sources loading  
      ```프로젝트 우클릭 > Run As > Maven install```
      
####2️⃣ _IntelliJ_ 에서  
   1. clone 한 프로젝트를 open  
      ```File -> Open```
   2. Maven sources loading  
      ```프로젝트 우클릭 > Maven > Generates sources and Update Folders```
      
---
####3️⃣ properties 파일 5개 생성 및 설정
   > 1. src/main/resources/```log4jdbc.log4j2.proterties```
   >   ~~~
   >   log4jdbc.drivers=org.mariadb.jdbc.Driver
   >   log4jdbc.spylogdelegator.name=net.sf.log4jdbc.log.slf4j.Slf4jSpyLogDelegator
   >   log4jdbc.dump.sql.maxlinelength=0
   >   ~~~

   >2. src/main/resources/properties/```Driver.proterties```
   >   ~~~
   >   Driver.driverClassName=net.sf.log4jdbc.sql.jdbcapi.DriverSpy
   >   Driver.url=jdbc:log4jdbc:mariadb://<YOUR_DB_IP>:<YOUR_DB_PORT>/<YOUR_DB_NAME>?useUnicode=true&allowMultiQueries=true&amp;characterEncoding=utf8&amp;serverTimezone=UTC
   >   Driver.username=<YOUR_DB_USERNAME>
   >   Driver.password=<YOUR_DB_PASSWORD>
   >   ~~~
   
   >3. src/main/resources/properties/```Email.proterties```
   >   ~~~
   >   Email.email=<YOUR_EMAIL>
   >   Email.password=<YOUR_EMAIL_PASSWORD>
   >   ~~~

   >4. src/main/resources/properties/```Api.proterties```
   >   ~~~
   >   kakaoapi.key=<YOUR_KAKAO_APP_JAVASCRIPT_KEY>
   >   ~~~
   
   >5. src/main/resources/properties/```Social.proterties```
   >   ~~~
   >   google.client-id=<YOUR_GOOGLE_CLIENT_ID>
   >   google.client-secret=<YOUR_GOOGLE_CLIENT_SECRET>
   >
   >   kakao.client-id=<YOUR_KAKAO_CLIENT_ID>
   >
   >   github.client-id=<YOUR_GITHUB_CLIENT_ID>
   >   github.client-secret=<YOUR_GITHUB_CLIENT_SECRET>
   >   ~~~

---
####4️⃣ STS or IntelliJ > Tomcat Configure 설정 후 > Run
<br><br/>
##📸 Site Screenshot
![main](https://raw.githubusercontent.com/bestTeam1/ProjectChting/master/src/main/webapp/images/chting_00_main.png)
![login](https://raw.githubusercontent.com/bestTeam1/ProjectChting/master/src/main/webapp/images/chting_01_login.png)
![mygroup](https://raw.githubusercontent.com/bestTeam1/ProjectChting/master/src/main/webapp/images/chting_02_mygroup.png)
![newbest](https://raw.githubusercontent.com/bestTeam1/ProjectChting/master/src/main/webapp/images/chting_03_newbest.png)
![calendar01](https://raw.githubusercontent.com/bestTeam1/ProjectChting/master/src/main/webapp/images/chting_04_calendar.png)
![calendar02](https://raw.githubusercontent.com/bestTeam1/ProjectChting/master/src/main/webapp/images/chting_05_calendar.png)
![chatting](https://raw.githubusercontent.com/bestTeam1/ProjectChting/master/src/main/webapp/images/chting_06_chatting.png)
![search](https://raw.githubusercontent.com/bestTeam1/ProjectChting/master/src/main/webapp/images/chting_07_search.png)
![admin](https://raw.githubusercontent.com/bestTeam1/ProjectChting/master/src/main/webapp/images/chting_09_admin.png)
##🧑🏻‍💻 Team Member
- 김수연 : https://github.com/hi-sooyeon
- 박주현 : https://github.com/joohyun93326
- 이승준 : https://github.com/Zagg2732
- 현상진 : https://github.com/HYUNSANGJIN
- 김영허 : https://github.com/kyi21556
- 김명환 : https://github.com/K-MyeongHwan

<br><br/>

---
