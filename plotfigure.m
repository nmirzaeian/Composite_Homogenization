function plt = plotfigure(css,pltdata)

phi2 = pltdata.phi2;
effK = pltdata.effK;
effMU = pltdata.effMU;
voK = pltdata.voK;
voMU = pltdata.voMU;
reK = pltdata.reK;
reMU = pltdata.reMU;
k = pltdata.k;
mu = pltdata.mu;

%% effective bulk modulus plot
figure
box on
hold on
axis([0 0.7 0 2]);
xticks(linspace(0,0.7,8));
yticks(linspace(0,2,9));
xlabel('$\phi^{(2)}$','interpreter','latex');
ylabel('$\bar{K}/K^{(1)}$','interpreter','latex');
H = gca;
H.LineWidth=2;
H.FontSize=16;

switch css
    case 'a'
        colororder(["#3498db";"#ffc400";"#00FF00";"#f4511e";"#7d3c98"]);
        plot(phi2,effK(1,:)/k(1),'LineWidth',5);
        plot(phi2,effK(2,:)/k(1),'LineWidth',3);
        plot(phi2,effK(3,:)/k(1),'LineWidth',2);
        plot(phi2,effK(4,:)/k(1),'-*','MarkerIndices',1:65:length(phi2),'LineWidth',1);
        plot(phi2,effK(5,:)/k(1),'--o','MarkerIndices',1:50:length(phi2),'LineWidth',1);
        plot(phi2,voK/k(1),'--k','LineWidth',2);
        plot(phi2,reK/k(1),':k','LineWidth',2);
        
        legend('Case 1','Case 2','Case 3','Case 4','Case 5','Voigt Approx.','Reuss Approx.',...
            'Location','northwest','NumColumns',2);

    case 'b'
        colororder(["#81c784";"#ffa726";"#ab47bc";"#5c6bc0";"#4fc3f7"]);
        plot(phi2,effK(1,:)/k(1),'LineWidth',2);
        plot(phi2,effK(2,:)/k(1),'LineWidth',4);
        plot(phi2,effK(3,:)/k(1),'LineWidth',2);
        plot(phi2,effK(4,:)/k(1),'-o','MarkerIndices',1:50:length(phi2),'LineWidth',1);
        plot(phi2,effK(5,:)/k(1),'LineWidth',2);
        plot(phi2,voK/k(1),'--k','LineWidth',2);
        plot(phi2,reK/k(1),':k','LineWidth',2);

        legend('Case 6','Case 7','Case 8','Case 9','Case 10','Voigt Approx.','Reuss Approx.',...
            'Location','northwest','NumColumns',2);
end


%% effective shear modulus plot
figure
box on
hold on
axis([0 0.7 0 2]);
xticks(linspace(0,0.7,8));
yticks(linspace(0,2,9));
xlabel('$\phi^{(2)}$','interpreter','latex');
ylabel('$\bar{\mu}/\mu^{(1)}$','interpreter','latex');
G = gca;
G.LineWidth=2;
G.FontSize=16;

switch css
    case 'a'
        colororder(["#3498db";"#ffc400";"#00FF00";"#f4511e";"#7d3c98"]);
        plot(phi2,effMU(1,:)/mu(1),'LineWidth',5);
        plot(phi2,effMU(2,:)/mu(1),'LineWidth',3);
        plot(phi2,effMU(3,:)/mu(1),'LineWidth',2);
        plot(phi2,effMU(4,:)/mu(1),'-*','MarkerIndices',1:65:length(phi2),'LineWidth',1);
        plot(phi2,effMU(5,:)/mu(1),'--o','MarkerIndices',1:50:length(phi2),'LineWidth',1);
        plot(phi2,voMU/mu(1),'--k','LineWidth',2);
        plot(phi2,reMU/mu(1),':k','LineWidth',2);

        legend('Case 1','Case 2','Case 3','Case 4','Case 5','Voigt Approx.','Reuss Approx.',...
            'Location','northwest','NumColumns',2);

    case 'b'
        colororder(["#81c784";"#ffa726";"#ab47bc";"#5c6bc0";"#4fc3f7"]);
        plot(phi2,effMU(1,:)/mu(1),'LineWidth',2);
        plot(phi2,effMU(2,:)/mu(1),'LineWidth',4);
        plot(phi2,effMU(3,:)/mu(1),'LineWidth',2);
        plot(phi2,effMU(4,:)/mu(1),'-o','MarkerIndices',1:50:length(phi2),'LineWidth',1);
        plot(phi2,effMU(5,:)/mu(1),'LineWidth',2);
        plot(phi2,voMU/mu(1),'--k','LineWidth',2);
        plot(phi2,reMU/mu(1),':k','LineWidth',2);

        legend('Case 6','Case 7','Case 8','Case 9','Case 10','Voigt Approx.','Reuss Approx.',...
            'Location','northwest','NumColumns',2);
end




