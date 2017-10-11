% Q.2.5 script

conf = evaluateRecognitionSystem();
disp(conf);
accuracy = trace(conf)/sum(conf(:));
disp(accuracy);