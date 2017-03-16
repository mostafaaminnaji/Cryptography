%Simulation of HW2, Cryptography Course , "Many-Time-Pad encryption"

%All of This Code was Written by Mostafa Amin-Naji  2017/03/07
% For contact me: Mostafa.Amin.Naji@gmail.com
% My other Website:
% 1) https://sites.google.com/site/mostafaaminnaji/
% 2) https://scholar.google.com/citations?user=z1gxuKcAAAAJ&hl=en
% 3) https://www.linkedin.com/in/mostafaaminnaji/

clc
clear
close all

%read cipher texts and target cipher text
cipher_text_1=char('315c4eeaa8b5f8aaf9174145bf43e1784b8fa00dc71d885a804e5ee9fa40b16349c146fb778cdf2d3aff021dfff5b403b510d0d0455468aeb98622b137dae857553ccd8883a7bc37520e06e515d22c954eba5025b8cc57ee59418ce7dc6bc41556bdb36bbca3e8774301fbcaa3b83b220809560987815f65286764703de0f3d524400a19b159610b11ef3e');
cipher_text_2=char('234c02ecbbfbafa3ed18510abd11fa724fcda2018a1a8342cf064bbde548b12b07df44ba7191d9606ef4081ffde5ad46a5069d9f7f543bedb9c861bf29c7e205132eda9382b0bc2c5c4b45f919cf3a9f1cb74151f6d551f4480c82b2cb24cc5b028aa76eb7b4ab24171ab3cdadb8356f');
cipher_text_3=char('32510ba9a7b2bba9b8005d43a304b5714cc0bb0c8a34884dd91304b8ad40b62b07df44ba6e9d8a2368e51d04e0e7b207b70b9b8261112bacb6c866a232dfe257527dc29398f5f3251a0d47e503c66e935de81230b59b7afb5f41afa8d661cb');
cipher_text_4=char('32510ba9aab2a8a4fd06414fb517b5605cc0aa0dc91a8908c2064ba8ad5ea06a029056f47a8ad3306ef5021eafe1ac01a81197847a5c68a1b78769a37bc8f4575432c198ccb4ef63590256e305cd3a9544ee4160ead45aef520489e7da7d835402bca670bda8eb775200b8dabbba246b130f040d8ec6447e2c767f3d30ed81ea2e4c1404e1315a1010e7229be6636aaa');
cipher_text_5=char('3f561ba9adb4b6ebec54424ba317b564418fac0dd35f8c08d31a1fe9e24fe56808c213f17c81d9607cee021dafe1e001b21ade877a5e68bea88d61b93ac5ee0d562e8e9582f5ef375f0a4ae20ed86e935de81230b59b73fb4302cd95d770c65b40aaa065f2a5e33a5a0bb5dcaba43722130f042f8ec85b7c2070');
cipher_text_6=char('32510bfbacfbb9befd54415da243e1695ecabd58c519cd4bd2061bbde24eb76a19d84aba34d8de287be84d07e7e9a30ee714979c7e1123a8bd9822a33ecaf512472e8e8f8db3f9635c1949e640c621854eba0d79eccf52ff111284b4cc61d11902aebc66f2b2e436434eacc0aba938220b084800c2ca4e693522643573b2c4ce35050b0cf774201f0fe52ac9f26d71b6cf61a711cc229f77ace7aa88a2f19983122b11be87a59c355d25f8e4');
cipher_text_7=char('32510bfbacfbb9befd54415da243e1695ecabd58c519cd4bd90f1fa6ea5ba47b01c909ba7696cf606ef40c04afe1ac0aa8148dd066592ded9f8774b529c7ea125d298e8883f5e9305f4b44f915cb2bd05af51373fd9b4af511039fa2d96f83414aaaf261bda2e97b170fb5cce2a53e675c154c0d9681596934777e2275b381ce2e40582afe67650b13e72287ff2270abcf73bb028932836fbdecfecee0a3b894473c1bbeb6b4913a536ce4f9b13f1efff71ea313c8661dd9a4ce');
cipher_text_8=char('315c4eeaa8b5f8bffd11155ea506b56041c6a00c8a08854dd21a4bbde54ce56801d943ba708b8a3574f40c00fff9e00fa1439fd0654327a3bfc860b92f89ee04132ecb9298f5fd2d5e4b45e40ecc3b9d59e9417df7c95bba410e9aa2ca24c5474da2f276baa3ac325918b2daada43d6712150441c2e04f6565517f317da9d3');
cipher_text_9=char('271946f9bbb2aeadec111841a81abc300ecaa01bd8069d5cc91005e9fe4aad6e04d513e96d99de2569bc5e50eeeca709b50a8a987f4264edb6896fb537d0a716132ddc938fb0f836480e06ed0fcd6e9759f40462f9cf57f4564186a2c1778f1543efa270bda5e933421cbe88a4a52222190f471e9bd15f652b653b7071aec59a2705081ffe72651d08f822c9ed6d76e48b63ab15d0208573a7eef027');
cipher_text_10=char('466d06ece998b7a2fb1d464fed2ced7641ddaa3cc31c9941cf110abbf409ed39598005b3399ccfafb61d0315fca0a314be138a9f32503bedac8067f03adbf3575c3b8edc9ba7f537530541ab0f9f3cd04ff50d66f1d559ba520e89a2cb2a83');
target_cipher_text=char('32510ba9babebbbefd001547a810e67149caee11d945cd7fc81a05e9f85aac650e9052ba6a8cd8257bf14d13e6f0a803b54fde9e77472dbff89d71b57bddef121336cb85ccb8f3315f4b52e301d16e9f52f904');

%seprate every double character in hex and convert it to dec
% length of target cipher text is selected as defult length
tally=0;
for i=1:2:length(target_cipher_text)
    tally=tally+1;
Target(tally)=hex2dec(target_cipher_text(i:i+1));
Text1(tally)=hex2dec(cipher_text_1(i:i+1));
Text2(tally)=hex2dec(cipher_text_2(i:i+1));
Text3(tally)=hex2dec(cipher_text_3(i:i+1));
Text4(tally)=hex2dec(cipher_text_4(i:i+1));
Text5(tally)=hex2dec(cipher_text_5(i:i+1));
Text6(tally)=hex2dec(cipher_text_6(i:i+1));
Text7(tally)=hex2dec(cipher_text_7(i:i+1));
Text8(tally)=hex2dec(cipher_text_8(i:i+1));
Text9(tally)=hex2dec(cipher_text_9(i:i+1));
Text10(tally)=hex2dec(cipher_text_10(i:i+1));
end

%in order to decrypte target ciphet text, doubly seprated target text is xor with all 10 cipher texts
for i=1:length(Target)
    
Xor_output(1,i)=bitxor(Target(i),Text1(i),'int16');
Xor_output(2,i)=bitxor(Target(i),Text2(i),'int16');
Xor_output(3,i)=bitxor(Target(i),Text3(i),'int16');
Xor_output(4,i)=bitxor(Target(i),Text4(i),'int16');
Xor_output(5,i)=bitxor(Target(i),Text5(i),'int16');
Xor_output(6,i)=bitxor(Target(i),Text6(i),'int16');
Xor_output(7,i)=bitxor(Target(i),Text7(i),'int16');
Xor_output(8,i)=bitxor(Target(i),Text8(i),'int16');
Xor_output(9,i)=bitxor(Target(i),Text9(i),'int16');
Xor_output(10,i)=bitxor(Target(i),Text10(i),'int16');

end

%print character table of xor of tariget cipher text with all 10 cipher texts 
Xor_output_table=char(Xor_output);

% in this section we choose alphabet only (a-z & A-Z) in Xor_output_table
for j=1:10
for i=1:83
    
   if (Xor_output(j,i)<=90 && Xor_output(j,i)>=65) || (Xor_output(j,i)<=122 && Xor_output(j,i)>=97)

       Xor_output_Alphabet_only(j,i)=(Xor_output(j,i));

   end
   
end

end

%print character table of xor of tariget cipher text with all 10 cipher texts 
Xor_output_table_alphabet_only=char(Xor_output_Alphabet_only);

% first we choose every cloumn of Xor_output_Alphabet_only

for i=1:83
    %Remove zero elemnts
    oo{i}=nonzeros(Xor_output_Alphabet_only(:,i));
    %sort the values of characters
    oo{i}=sort(oo{i});
    %compute histogram of number ar occured characters in ith-cloumn of Xor_output_Alphabet_only
    out_histc{i}=histc(oo{i},unique(oo{i}));
    %find the maximum number position of occured character in histogram
    position{i}=find(out_histc{i}==max(out_histc{i}));
    
    %remove Duplicate characters
    ooo=unique(oo{i});
    
    %if the maximum number of occured character in only one...
    %the decrypted character is choosed otherwise "space" character is choosed
    if (length(position{i})==1  && position{i}==1)
       
        decrypted_text(i)=ooo(position{i});
    
    else
        decrypted_text(i)=32;
    end
%in order to convert lwercase to uppercase and uppercase to lowecase...
% decrypted_text is xor with "space" character
    decrypted_target_text(i)=bitxor(32,decrypted_text(i),'int16');
    
    %primary achieved key for decrypted_target_text is:
    key(i)=bitxor(Target(i),decrypted_target_text(i),'int16');
    
    % in order to correctin achieved decrypted_target_text we hold...
    % decrypted_target_text_modified in cells
    decrypted_target_text_modified{i}= char(decrypted_target_text(i));
end
%Print primary decrypted_target_text
primary_decrypted_target_text=char(decrypted_target_text)

%check the English spell of decrypted_target_text and...
%correct the incomplete word by english dictionory
decrypted_target_text_modified{8}='r';
decrypted_target_text_modified{26}='e';
decrypted_target_text_modified{31}='i';
decrypted_target_text_modified{33}='g';

%convert cell of decrypted_target_text_modified to arrey
for i=1:83
    decrypted_target_text_modified2(i)=decrypted_target_text_modified{i};
    %create modified key
    key_modified(i)=bitxor(Target(i),double(decrypted_target_text_modified2(i)),'int16');
end

%Print secondary achieved decrypted_target_text
secondary_decrypted_target_text=decrypted_target_text_modified2


%in order to corroect more the secondary_decrypted_target_text...
%extract decrypted_text7 by xor the Text7 with key_modified
for i=1:83
decrypted_text7(i)=bitxor(Text7(i),key_modified(i),'int16');
% in order to correctin more of achieved secondary_decrypted_target_text...
% we hold decrypted_text7_modified in cells
decrypted_text7_modified{i}=char(decrypted_text7(i));
end
%Print primary decrypted_text7
primary_decrypted_text7=char(decrypted_text7)

%check the English spell of decrypted_text7_modified and...
%correct the incomplete word by english dictionory
decrypted_text7_modified{22}='f';
decrypted_text7_modified{50}='w';

%convert cell of decrypted_text7_modified to arrey
for i=1:83
decrypted_text7_modified2(i)=decrypted_text7_modified{i};
%create secondary modified key & final Key from 
key7_modified(i)=bitxor(Text7(i),double(decrypted_text7_modified2(i)),'int16');
   
end
%Print secondary achieved decrypted_target_text
decrypted_text7_modified2=decrypted_text7_modified2

%Extract Final decrypted target text by xor key7_modified with Target...
%ciphered text
for i=1:83
Final_decrypted_target_text(i)=bitxor(Target(i),key7_modified(i),'int16');

end
%Final Key for decrypted target text
Final_Key=(dec2hex(key7_modified))'

%Final decrypted target text
Final_decrypted_target_text=char(Final_decrypted_target_text)




%
%
% Matlab Code Results :
 
 
% primary_decrypted_target_text =
% The secuet message is  Whtn us n  a stream cipher  never use the key more than once

% secondary_decrypted_target_text =
% The secret message is  When using a stream cipher  never use the key more than once

% primary_decrypted_text7 =
% TheRe are Two typeS o\ cyptOgraphY: one thAt allo[S the goveRnmeNt tO use brutE for

% decrypted_text7_modified2 =
% TheRe are Two typeS of cyptOgraphY: one thAt allowS the goveRnmeNt tO use brutE for

% Final_Key =
% 636ACDDC9712C6912AE7A7C2A76E82C0693B1FA4194788C6C6DF134CFE0D7A8715AFCD9434286B6F39669E99B8C845AD350EFE8AFD80FB9D95B903A98A0ACD0F00673E0218D8820B9773DECC5C3AB6B0FE0CA1

% Final_decrypted_target_text =
% The secret message is: When using a stream cipher, never use the key more than once

